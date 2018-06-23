class Admin::PhotosController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user?

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

  def admin_user?
    redirect_to root_path if !current_user.admin?
  end

end
