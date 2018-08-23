namespace :generate do

  desc "Generate random weather data"

  task :cities => :environment do
    cities = [
      {city: 'Santa Clara', region: 'CA', country: 'United States', code: 'sancla'},
      {city: 'Mountain View', region: 'CA', country: 'United States', code: 'mview'},
      {city: 'Mumbai', region: 'MH', country: 'India', code: 'mum'},
      {city: 'Chennai', region: 'TN', country: 'India', code: 'che'}
    ]
    cities.each do |c|
      city = City.find_by_code c[:code]
      if city.nil?
        City.create(
          city: c[:city],
          region: c[:region],
          country: c[:country],
          code: c[:code]
        )
      end
    end
  end

  task :weather_data => :environment do
    ['mum', 'che', 'sancla', 'mview'].each do |city|
      (Date.today..(Date.today + 20.days)).to_a.each do |date|
        Weather.create(
          code: city,
          date: date,
          high: (60..70).to_a.sample,
          low: (50..60).to_a.sample,
          condition: ['Thunderstorms', 'Scattered Thunderstorms', 'Partly Cloudy', 'Cloudy', 'Mostly Cloudy', 'Rain', 'Scattered Showers', 'Mostly Sunny'].sample
        )
      end
    end
  end

end
