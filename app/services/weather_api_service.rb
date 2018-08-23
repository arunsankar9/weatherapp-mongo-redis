class WeatherApiService

  def initialize city_code
    @city_code = city_code
  end

  def forecast
    uri = getURL :forecast
    response = HttpService.get(uri, false)
    return JSON.parse(response)
  end

  private

  def getURL type
    if type == :forecast
      "http://localhost:3002/api/v1/climate/#{@city_code}"
    end
  end

end
