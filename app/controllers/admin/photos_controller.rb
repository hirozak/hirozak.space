class Admin::PhotosController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user?

  def index
  end

  def create
  end

  def destroy
  end

  private

  def admin_user?
    redirect_to root_path if !current_user.admin?
  end

end
