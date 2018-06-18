class PostsController < ApplicationController

  def index
  end

  def show
    @post = Post.find_by(slug: params[:id])
    redirect_to root_path if @post.Draft?
  end

end
