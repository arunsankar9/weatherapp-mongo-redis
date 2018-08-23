class City < ActiveRecord::Base
  validates :code, uniqueness: true
end
