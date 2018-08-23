module WeatherHelper

  def parse_forecast_info forecast_info
    forecast_info = forecast_info['query']['results']['channel']['item']['forecast']
    dates = forecast_info.pluck('date')
    days = forecast_info.pluck('day')
    high = forecast_info.pluck('high')
    low = forecast_info.pluck('low')
    text = forecast_info.pluck('text')
    return dates, days, high, low, text
  end

  def parse_location_info forecast_info
    forecast_info = forecast_info['query']['results']['channel']['location']
    city = forecast_info['city']
    region = forecast_info['region']
    country = forecast_info['country']
    return city, region, country
  end

  def parse_units_info forecast_info
    forecast_info = forecast_info['query']['results']['channel']['units']
    distance = forecast_info['distance']
    pressure = forecast_info['pressure']
    speed = forecast_info['speed']
    temperature = forecast_info['temperature']
    return distance, pressure, speed, temperature
  end

  def parse_current_weather forecast_info
    forecast_info = forecast_info['query']['results']['channel']['item']['condition']
    date = forecast_info['date']
    temp = forecast_info['temp']
    text = forecast_info['text']
    return date, temp, text
  end

end
