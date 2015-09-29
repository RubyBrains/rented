class Search < ActiveRecord::Base

	def search_places
		places = Place.all

		places = places.where(["country LIKE ?","%#{country_name}%"]) if country_name.present?
		places = places.where(["state LIKE ?","%#{state_name}%"]) if statecity_name.present?
		places = places.where(["city LIKE ?","%#{city_name}%"]) if city_name.present? 
		places = places.where(["property_type LIKE ?",property]) if property.present?
		places = places.where(["max_occupancy LIKE ?",occupancy]) if occupancy.present?
		places = places.where(["bedrooms LIKE ?",bed_room]) if bed_room.present?
		places = places.where(["month_price.to_s >= ?",min_price]) if min_price.present?
		places = places.where(["month_price.to_s <= ?",max_price]) if max_price.present?

		return places
	end

end