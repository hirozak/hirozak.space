class Admin::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user?

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to edit_admin_post_path(@post), notice: "記事を投稿しました。"
    else
      flash.alert = "投稿に失敗しました。"
      render :new
    end
  end

  def edit
    @post = Post.find_by(slug: params[:id])
  end

  def update
    @post = Post.find_by(slug: params[:id])
    # binding.pry
    if @post.update(post_params)
      redirect_to edit_admin_post_path(@post), notice: "記事を更新しました。"
    else
      flash.alert = "記事の更新に失敗しました。"
      render :edit
    end
  end

  def destroy
    post = Post.find_by(slug: params[:id])
    if post.destroy
      flash[:notice] = "削除しました。"
      redirect_back(fallback_location: all_admin_posts_path)
    else
      flash.alert = "削除できませんでした。"
      redirect_back(fallback_location: all_admin_posts_path)
    end
  end

  def all
    @posts = current_user.posts.includes(:category).default_order.page(params[:page]).per(8)
  end

  def published
    @posts = current_user.posts.published.includes(:category).default_order.page(params[:page]).per(8)
  end

  def drafts
    @posts = current_user.posts.drafts.includes(:category).default_order.page(params[:page]).per(8)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :image, :published, :category_id, :tag_list, :slug, :favorite, :description)
  end

  def admin_user?
    redirect_to root_path if !current_user.admin?
  end
end
