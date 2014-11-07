require 'rest_client'

module WhizClient

  class WhizResponseError < StandardError
    attr_reader :error_message, :error_code

    def initialize(error_message, error_code)
      @error_message = error_message
      @error_code = error_code
    end
  end

  class Client

    INDIAN_API_URL = 'https://www.whizapi.com/api/v2/util/ui/in/'
    GEO_API_URL = 'https://www.WhizAPI.com/api/v2/geo/time/ui/'

    APP_KEY = 'xxxxxxxx'

    class << self

      def request(params)
        request_type = params[:api_type]
        url = case request_type
          when 'indian' then construct_indian_api_url(params)
          when 'geo' then construct_geo_api_url(params)
        end

        begin
          RestClient.get URI.encode(url)
        rescue URI::InvalidURIError
          raise WhizResponseError.new('Invalid Url', 500)
        rescue => error
          raise WhizResponseError.new("Error: #{error.message}", 500)
        end
      end

      private

      def construct_indian_api_url(params)
        url = "#{INDIAN_API_URL}#{params[:method_name]}?AppKey=#{APP_KEY}"
        url += "&stateid=#{params[:stateid]}" if params.has_key? :stateid
        url += "&code=#{params[:std_code]}" if params.has_key? :std_code
        url += "&search=#{params[:location]}" if params.has_key? :location
        url += "&pin=#{params[:postal_code]}" if params.has_key? :postal_code
        url
      end

      def construct_geo_api_url(params)
        url = "#{GEO_API_URL}#{params[:method_name]}?AppKey=#{APP_KEY}"
        url += "&zid=#{params[:time_zone]}" if params.has_key? :time_zone
        url
      end

    end
  end
end