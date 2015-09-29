class PlaceImage < ActiveRecord::Base

	belongs_to :place

	has_attached_file :photo, styles: { thumb: "150x150#", large: "400x400>", medium: "200x200>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
	validates_attachment_presence :photo
end
