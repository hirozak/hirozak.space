class TopController < ApplicationController

  def index
    @posts = Post.published.includes(:category).default_order.limit(8)
    post_ids = PopularPost.all.map(&:post_id)
    @popular_posts = Post.find [post_ids].take(4)
    @slider_posts = Post.published.favorite.includes(:category).default_order.limit(8)
  end

end
