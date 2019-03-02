class TopController < ApplicationController
  def index
    @posts = Post.published.includes(:category).default_order.page(params[:page]).per(8)
    @popular_posts = PopularPost.includes(post: :category).map(&:post).take(6)
    @slider_posts = Post.published.favorite.includes(:category).default_order.limit(8)
  end
end
