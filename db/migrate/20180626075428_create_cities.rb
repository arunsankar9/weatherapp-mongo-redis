class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :city
      t.string :region
      t.string :country
      t.string :code
    end
  end
end
