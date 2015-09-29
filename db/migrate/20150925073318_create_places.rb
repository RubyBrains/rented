class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :title
      t.text :description
      t.string :property_type
      t.string :max_occupancy
      t.string :bedrooms
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.string :month_price
      t.string :special_info

      t.timestamps null: false
    end
  end
end
