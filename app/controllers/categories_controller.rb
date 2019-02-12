class CategoriesController < ApplicationController
  def show
    @category = Category.find_by(name: params[:id])
    @posts = @category.posts.published.default_order.page(params[:page]).per(12) if @category.posts
    @slider_posts = Post.published.favorite.default_order.limit(8)
  end
end
