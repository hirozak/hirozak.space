class TagsController < ApplicationController
  def index
    @tags = Post.tags_on(:tags)
    @slider_posts = Post.published.favorite.default_order.limit(8)
  end

  def show
    @tag = ActsAsTaggableOn::Tag.find_by(name: params[:id])
    @posts = Post.tagged_with(@tag.name).published.default_order.page(params[:page]).per(12)
    @slider_posts = Post.published.favorite.default_order.limit(8)
  end
end
