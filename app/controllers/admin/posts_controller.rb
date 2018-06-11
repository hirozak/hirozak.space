class Admin::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user?

  def index
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.category_id = 1
    @post.save!
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :image)
  end

  def admin_user?
    redirect_to root_path if !current_user.admin?
  end
end
