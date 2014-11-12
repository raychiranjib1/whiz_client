require 'json'
require "whiz_client/version"
require "whiz_client/client"

module WhizClient
  class WhizBase
    class << self
      def parse(response)
        response_hash = JSON.parse(response)
        response_hash['Data']
      end

      def method_missing(method_sym, *arguments, &block)
        finder = DynamicFinderMatch.new(method_sym, arguments)

        raise WhizResponseError.new('Undefined Method', 500) unless finder.match?

        params = request_params(finder.params)

        response = Client.request(params)
        parse(response)
      end

      def request_params(params)
        raise NotImplementedError
      end
    end
  end

  class DynamicFinderMatch

    attr_accessor :first_attribute, :last_attribute, :arguments

    def initialize(method_sym, arguments)
      if method_sym.to_s =~ /^find_(.*)_by_(.*)$/
        @first_attribute = $1
        @last_attribute = $2
        @arguments = arguments
      elsif method_sym.to_s =~ /^list_all_(.*)$/
        @first_attribute = $1
        @arguments = arguments
      end
    end

    def match?
      @first_attribute != nil || @last_attribute != nil
    end

    def params
      if last_attribute.nil?
        params_with_single_attribute
      else
        params_with_multiple_attibutes
      end
    end

    private

    def argument
      arguments.first
    end

    def params_with_single_attribute
      if first_attribute == 'states'
        { method_name: 'indian-states-list' }
      elsif first_attribute == 'time_zones'
        { method_name: 'time-zones' }
      end
    end

    def params_with_multiple_attibutes
      if first_attribute == 'city'
        params_for_cities
      elsif first_attribute == 'std_codes' && last_attribute == 'location'
        { location: argument, method_name: 'indian-std-codes' }
      elsif first_attribute == 'postal_code' && last_attribute == 'location'
        { location: argument, method_name: 'indian-postal-codes' }
      elsif first_attribute == 'current_time' && last_attribute == 'timezone'
        { time_zone: argument, method_name: 'current-time-of-timezone' }
      end
    end

    def params_for_cities
      if last_attribute == 'state'
        { stateid: argument, method_name: 'indian-city-by-state' }
      elsif last_attribute == 'std_codes'
        { std_code: argument, method_name: 'city-from-std-codes' }
      elsif last_attribute == 'postal_code'
        { postal_code: argument, method_name: 'indian-city-by-postal-code' }
      end
    end

  end

  class India < WhizBase

    class << self

      private

      def request_params(params)
        { api_type: 'indian' }.merge(params)
      end
    end
  end

  class Geo < WhizBase
    class << self

      private

      def request_params(params)
        { api_type: 'geo' }.merge(params)
      end

    end
  end
end