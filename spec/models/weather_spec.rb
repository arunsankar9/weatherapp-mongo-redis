require "rails_helper"

RSpec.describe Weather, :type => :model do
  it "named scope `for_city` should return weather info for that city" do
    City.create(code: 'fm', city: 'Fremont', region: 'CA', country: 'United States')
    City.create(code: 'sac', city: 'Sacramento', region: 'CA', country: 'United States')
    (Date.today..(Date.today + 5.days)).to_a.each do |date|
      ['fm', 'sac'].each do |code|
        Weather.create(
          code: code,
          date: date,
          high: (60..70).to_a.sample,
          low: (50..60).to_a.sample,
          condition: ['Thunderstorms', 'Scattered Thunderstorms'].sample
        )
      end
    end
    expect(Weather.for_city('fm').map(&:code).uniq).to contain_exactly('fm')
    expect(Weather.for_city('sac').map(&:code).uniq).to contain_exactly('sac')
  end
  it "named scope `forecast` should return forecast for specified days" do
    next_date = Date.today + 3.days
    City.create(code: 'fm', city: 'Fremont', region: 'CA', country: 'United States')
    City.create(code: 'Sac', city: 'Sacramento', region: 'CA', country: 'United States')
    (Date.today..(Date.today + 5.days)).to_a.each do |date|
      ['fm', 'sac'].each do |code|
        Weather.create(
          code: code,
          date: date,
          high: (60..70).to_a.sample,
          low: (50..60).to_a.sample,
          condition: ['Thunderstorms', 'Scattered Thunderstorms'].sample
        )
      end
    end
    expect(Weather.for_city('fm').forecast(3).last.date).to eq(next_date)
  end
end
