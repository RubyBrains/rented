class PlacesController < ApplicationController

  before_action :authenticate_user!, except: [:index ]
  before_action :find_place, only: [:show, :destroy, :update, :edit]
  
  def index
    @places = Place.search(params[:search]).order("created_at DESC")
  end

  def new
    @place = Place.new
    @place.place_images.build 
  end

  def create
      @place = current_user.places.build(place_params)
      

      if @place.save
        if params[:photos]
          params[:photos].each { |photo|
          @place.place_images.create(photo: photo) 
          }
        end
        redirect_to @place
      else
        flash[:messages] ||= []
        flash[:messages] << @place.errors.full_messages
        render 'new'
      end
  end

  def show
    #@place = Place.includes(:owner).find(params[:id])
  end

  def destroy
    
    @place.destroy

    redirect_to root_path
  end

  def edit
    @place.place_images.build 
  end

  def update
    @place.update_attributes(place_params)
    


    redirect_to current_user

  end

  private 
    def place_params
      params.require(:place).permit(:title, :description, :property_type, :max_occupancy, :bedrooms, :photos, :city, :state, :zip, :country, :month_price, :special_info )
    end

    def find_place
      @place = Place.find(params[:id])

    end
end
