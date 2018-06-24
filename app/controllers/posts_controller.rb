class PostsController < ApplicationController

  def show
    @post = Post.published.find_by(slug: params[:id])
    @popular_posts = Post.published.favorite.includes(:category).default_order.limit(5)
    @similar_posts = @post.category.posts.published.includes(:category).where("id != ?", @post.id).default_order.limit(4)
  end

end
