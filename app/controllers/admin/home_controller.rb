class Admin::HomeController < Admin::ApplicationController
  def index
    @posts = current_user.posts
    @published = current_user.posts.published
    @drafts = current_user.posts.drafts
    @categories = Category.all
    @tags = ActsAsTaggableOn::Tag.all
  end
end
