module Api
  module V1
    class ClimateController < ApplicationController
      def index
        @city = City.find_by_code params[:code]
        if @city.present?
          key = "forecast_api_#{params[:code]}"
          cached_response = $redis.get(key)
          if cached_response.present?
            @forecast = JSON.parse cached_response
          else
            forecast = Weather.for_city(params[:code]).forecast(10).to_json
            $redis.set(key, forecast)
            $redis.expire(key, 3600)
            @forecast = JSON.parse forecast
          end
          @condition = @forecast.first
        else
          render template: 'api/v1/climate/not_found'
        end
      end

    end
  end
end
