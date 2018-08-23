class WeatherFetchService

  def initialize city
    @city = city
  end

  def forecast
    key = formKey :forecast
    return JSON.parse($redis.get(key)) if $redis.get(key).present?
    uri = formQuery :forecast
    response = HttpService.get(uri)
    $redis.set(key, response)
    $redis.expire(key, 3600)
    return JSON.parse(response)
  end

  private

  def formQuery type
    if type == :forecast
      "https://query.yahooapis.com/v1/public/yql?q=select * from weather.forecast where woeid in (select woeid from geo.places(1) where text=\"#{@city}\")&format=json&env=store://datatables.org/alltableswithkeys"
    end
  end

  def formKey type
    if type == :forecast
      "forecast_" + @city.split.join('-')
    end
  end

end
