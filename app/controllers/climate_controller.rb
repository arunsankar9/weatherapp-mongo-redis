class ClimateController < ApplicationController
  def index
  end

  def forecast
    @forecast = WeatherApiService.new(params[:code]).forecast
  end
end
