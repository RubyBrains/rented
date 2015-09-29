class CreatePlaceImages < ActiveRecord::Migration
  def change
    create_table :place_images do |t|
      t.integer :place_id

      t.timestamps null: false
    end
  end
end
