class PostsController < ApplicationController

  def index
  end

  def show
    @post = Post.find(params[:id])
    redirect_to root_path if @post.Draft?
  end

end
