class SearchesController < ApplicationController

	def new
		@search = Search.new
		@properties = ("apartment, house, cabin, villa castle, dorm, treehouse, boat, plane, van, camper, igloo, lighthouse, yurt, tipi, cave, island, chalet, earth-house, hut, tent, other").split(', ')
		@properties.each { |prp| prp.capitalize! }
		@occupancies = ("1,2,3,4,5,6,7,8,9,10,11,12,13,15,16,16+").split(',')
		@bed_rooms = ("1,2,3,4,5,6,7,8,9,10,10+").split(',')
		
	end

	def create
		@search = Search.create(search_params)
		redirect_to @search
	end

	def show
		@search = Search.find(params[:id])
	end

	private 
		def search_params
			params.require(:search).permit(:country_name, :state_name, :city_name, :property, :occupancy, :bed_room, :max_price, :min_price)
		end


end
