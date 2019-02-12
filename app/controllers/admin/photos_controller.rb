class Admin::PhotosController < ApplicationController
  def index
    @photos = Photo.all.order("created_at desc").limit(10)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      respond_to do |format|
        format.html
        format.json
      end
    else
      render json: { error: @photo.errors.full_messages.join('.') }, status: 400
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:image)
  end

end
