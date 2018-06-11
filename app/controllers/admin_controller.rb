class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user?
  def index
  end

  private

  def admin_user?
    redirect_to root_path if !current_user.admin?
  end
end
