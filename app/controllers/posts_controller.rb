class PostsController < ApplicationController

  def index
  end

  def show
    @post = Post.find_by(slug: params[:id])
    redirect_to root_path if @post.Draft?
    @popular_posts = Post.published.favorite.includes(:category).default_order.limit(5)
    @similar_posts = @post.category.posts.published.includes(:category).default_order.limit(4)
  end

end
