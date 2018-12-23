class PostsController < ApplicationController

  def show
    @post = Post.published.find_by(slug: params[:id])
    post_ids = PopularPost.all.map(&:post_id)
    @popular_posts = Post.includes(:category).find [post_ids].take(5)
    @similar_posts = @post.category.posts.published.where("id != ?", @post.id).default_order.limit(4)
  end

end
