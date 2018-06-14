class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user?
  def index
    @posts = current_user.posts
    @published = current_user.posts.published
    @drafts = current_user.posts.drafts
    @categories = Category.all
    @tags = ActsAsTaggableOn::Tag.all
  end

  private

  def admin_user?
    redirect_to root_path if !current_user.admin?
  end
end
