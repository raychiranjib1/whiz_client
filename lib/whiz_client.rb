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

      def request_params(params)
        raise NotImplementedError
      end
    end
  end

  class India < WhizBase

    class << self

      def list_all_states
        response = Client.request(request_params(method_name: 'indian-states-list'))
        parse(response)
      end

      def find_city_by_state(stateid)
        response = Client.request(request_params(stateid: stateid, method_name: 'indian-city-by-state'))
        parse(response).map {|hash| hash['city'] }
      end

      def find_city_by_std_codes(std_code)
        response = Client.request(request_params(std_code: std_code, method_name: 'city-from-std-codes'))
        parse(response)
      end

      def find_std_codes_by_location(location)
        response = Client.request(request_params(location: location, method_name: 'indian-std-codes'))
        parse(response)
      end

      def find_city_by_postal_code(postal_code)
        response = Client.request(request_params(postal_code: postal_code, method_name: 'indian-city-by-postal-code'))
        parse(response)
      end

      def find_postal_code_by_location(location)
        response = Client.request(request_params(location: location, method_name: 'indian-postal-codes'))
        parse(response)
      end

      private

      def request_params(params)
        { api_type: 'indian' }.merge(params)
      end
    end
  end

  class Geo < WhizBase
    class << self

      def time_zones
        response = Client.request(request_params(method_name: 'time-zones'))
        parse(response).map { |hash| hash.values }.flatten
      end

      def current_time_of_timezone(time_zone)
        response = Client.request(request_params(method_name: 'current-time-of-timezone', time_zone: time_zone ))
        parse(response)
      end

      private

      def request_params(params)
        { api_type: 'geo' }.merge(params)
      end

    end

  end

end