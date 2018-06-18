class TopController < ApplicationController
  def index
    @posts = Post.published.default_order.limit(8)
    @popular_posts = Post.published.favorite.default_order.limit(4)
  end
end
