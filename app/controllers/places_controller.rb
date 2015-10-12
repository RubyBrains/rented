class PlacesController < ApplicationController
  
  before_action :authenticate_user!, except: [:index ]
  before_action :find_place, only: [:show, :destroy, :update, :edit]
  
  def index
    @places = Place.search(params[:search]).order("created_at DESC")
  end

  def new
    @place = Place.new
    
  end

  def create
    @place = current_user.places.build(place_params)
      
    respond_to do |format|  
      if @place.save
        if params[:photos]
        
          params[:photos].each { |photo|
            @place.place_images.create(photo: photo)
          }
        end
        format.html { redirect_to @place, notice: 'Flat was successfully created.' }
        format.json { render json: @place, status: :created, location: @place }
      else
        flash[:messages] ||= []
        flash[:messages] << @place.errors.full_messages
        render 'new'
      end
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
    
  end

  def update
    respond_to do |format|
      if @place.update_attributes(place_params)
        if params[:photos]
          # The magic is here ;)
          params[:photos].each { |image|
            @place.pictures.create(photo: image)
          }
        end
        format.html { redirect_to @place, notice: 'Gallery was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  private 
    def place_params
      params.require(:place).permit(:title, :description, :property_type, :max_occupancy, :bedrooms, :place_images, :city, :state, :zip, :country, :month_price, :special_info )
    end

    def find_place
      @place = Place.find(params[:id])

    end

end
