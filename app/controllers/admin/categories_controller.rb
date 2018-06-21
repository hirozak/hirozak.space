class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user?
  before_action :set_categories

  def index
    @category = Category.new
  end

  def show
    @category = Category.find_by(name: params[:id])
    @posts = @category.posts.includes(:category).default_order.page(params[:page]).per(8)
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path, notice: "カテゴリを作成しました。"
    else
      flash.alert = "カテゴリーの作成に失敗しました。"
      render :index
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_categories
    @categories = Category.all
  end

  def admin_user?
    redirect_to root_path if !current_user.admin?
  end
end
