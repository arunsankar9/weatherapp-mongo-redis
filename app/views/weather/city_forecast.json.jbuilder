json.results do
  json.location do
    json.city @city.city
    json.region @city.region
    json.country @city.country
  end
  json.condition do
    json.date @condition['date']
    json.high @condition['high']
    json.low @condition['low']
    json.condition @condition['condition']
  end
  json.forecast do
    json.array!(@forecast) do |item|
      json.date item['date']
      json.high item['high']
      json.low item['low']
      json.condition item['condition']
    end
  end
end
