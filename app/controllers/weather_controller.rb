class WeatherController < ApplicationController

  def forecast
    @forecast = WeatherFetchService.new(params[:city]).forecast
  end

end
