class PlaceImage < ActiveRecord::Base

	belongs_to :place

	has_attached_file :photo, styles: { thumb: "150x150#", large: "400x400>", medium: "200x200>" }, :path => ":rails_root/public/images/:id/:filename",
    :url  => "/images/:id/:filename"
	validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
	validates_attachment_presence :photo
	
end
