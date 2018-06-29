class TopController < ApplicationController

  def index
    @posts = Post.published.includes(:category).default_order.limit(8)
    @popular_posts = Post.published.favorite.includes(:category).limit(4)
    @slider_posts = Post.published.favorite.includes(:category).default_order.limit(8)
  end

end
