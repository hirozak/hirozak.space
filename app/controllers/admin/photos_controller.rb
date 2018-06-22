class Admin::PhotosController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user?

  def index
  end

  def create
    binding.pry
    @photo = Photo.new(photo_params)
    if @photo.save
      render json: { messsage: 'success', photoId: @photo.id}, status: 200
    else
      render json: { error: @photo.errors.full_messages.join('.') }, status: 400
    end
  end

  def destroy
  end

  private

  def photo_params
    params.require(:photo).permit(:image)
  end

  def admin_user?
    redirect_to root_path if !current_user.admin?
  end

end
