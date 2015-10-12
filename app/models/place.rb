class Place < ActiveRecord::Base
	#attr_accessor :bedrooms, :description, :place_images, :max_occupancy, :property_type, :title, :address_attributes, :month_price, :check_in, :check_out, :special_info
    #attr_accessor :place_images_attributes
    belongs_to :user  
    
    has_many :place_images, dependent: :destroy 
    validates_associated :place_images
    accepts_nested_attributes_for :place_images

    def self.search(search)
    	if search
    		where(["city LIKE ? OR country LIKE ?", "%#{search}%", "%#{search}%"])
    	else
    		all
    	end
    end

end
