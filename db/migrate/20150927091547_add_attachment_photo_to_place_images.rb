class AddAttachmentPhotoToPlaceImages < ActiveRecord::Migration
  def self.up
    change_table :place_images do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :place_images, :photo
  end
end
