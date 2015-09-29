class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :country_name
      t.string :state_name
      t.string :city_name
      t.string :property
      t.string :occupancy
      t.string :bed_room
      t.integer :max_price
      t.integer :min_price

      t.timestamps null: false
    end
  end
end
