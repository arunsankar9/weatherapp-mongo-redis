require "rails_helper"

RSpec.describe City, :type => :model do
  it "should validate uniqueness of code" do
    City.create(code: 'sun', city: 'Sunnyvale', region: 'SV', country: 'United States')
    city = City.new(code: 'sun', city: 'Sunnyvale', region: 'SV', country: 'United States')
    city.valid?
    expect(city.errors[:code].size).to eq(1)
  end
end
