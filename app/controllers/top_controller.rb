class TopController < ApplicationController
  def index
    @posts = Post.published.default_order.limit(8)
    # @popular_posts = Post.where()
  end
end
