class CategoriesController < ApplicationController

  def index
  end

  def show
    @category = Category.find_by(name: params[:id])
    @posts = @category.posts.published.includes(:category).default_order.page(params[:page]).per(12) if @category.posts
  end

end
