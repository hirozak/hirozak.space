class PostsController < ApplicationController
  def index
    @posts = Post.published.includes(:category).default_order.page(params[:page]).per(8)
    @slider_posts = Post.published.favorite.default_order.limit(8)
  end

  def show
    @post = Post.published.find_by(slug: params[:id])
    @popular_posts = PopularPost.includes(post: :category).map(&:post)
    @similar_posts = @post.category.posts.published.where('id != ?', @post.id).default_order.limit(4)
  end
end
