class Weather
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic
  store_in collection: "weather"

  scope :for_city, -> (code) { where(code: code) }
  scope :forecast, -> (days) { where(date: (Date.today..(Date.today + days.days))).order("date ASC") }
end
