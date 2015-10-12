class PlaceImagesController < ApplicationController

	def index

    @place = Place.find(params[:place_id])

    @place_images = @place.place_images

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @place_images }
    end
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    @place_image = PlaceImage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @place_image }
    end
  end

  # GET /pictures/new
  # GET /pictures/new.json
  def new
    @place = Place.find(params[:place_id])
    @place_image = @place.place_image.build

    respond_to do |format|place_image
      format.html # new.html.erb
      format.json { render json: @place_image }
    end
  end

  # GET /pictures/1/edit
  def edit
    #@gallery = Gallery.find(params[:gallery_id])

    @place_image = PlaceImage.find(params[:id])
    # @picture = Picture.find(params[:id])
  end

  # POST /pictures
  # POST /pictures.jsonplace
  def create
    @place_image = PlaceImage.new(params[:place_image])

    if @place_image.save
      respond_to do |format|
        format.html {
          render :json => [@place_image.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json {
          render :json => [@place_image.to_jq_upload].to_json
        }
      end
    else
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

  # PUT /pictures/1
  # PUT /pictures/1.json
  def updateplace_image

    @place = Place.find(params[:place_id])

    @place_image = @place.place_images.find(params[:id])

    respond_to do |format|
      if @place_image.update_attributes(place_image_params)
        format.html { redirect_to gallery_path(@place), notice: 'Picture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @place_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    #@gallery = Gallery.find(params[:gallery_id])
    #@picture = @gallery.pictures.find(params[:id])
    @place_image = PlaceImage.find(params[:id])
    @place_image.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  def make_default
    @place_image = PlaceImage.find(params[:id])
    @place = Place.find(params[:place_id])

    @place.cover = @place_image.id
    @place.save

    respond_to do |format|
      format.js
    end
  end

  private

  def place_image_params
    params.require(:place_image).permit( :place_id, :photo)
  end


end
