class AllController < ApplicationController

  def index
    @posts = Post.published.includes(:category).default_order.page(params[:page]).per(8)
  end

end
