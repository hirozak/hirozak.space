class TopController < ApplicationController

  def index
    analytics = Analytics.new
    @posts = Post.published.includes(:category).default_order.limit(8)
    @popular_posts = analytics.popular_posts.take(4)
    @slider_posts = Post.published.favorite.includes(:category).default_order.limit(8)
  end

end
