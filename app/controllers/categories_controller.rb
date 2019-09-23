class CategoriesController < ApplicationController

  before_action :set_category, only: %i[show edit update]
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = 'Category created successfully'
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def show
    @article_titles = @category.articles.pluck(:title)
    @usernames = User.where(id: @category.articles.pluck(:user_id)).pluck(:username)
  end

  def edit; end

  def update
    if @category.update(category_params)
      flash[:success] = 'Category updated successfully'
      redirect_to category_path(@category)
    else
      render 'edit'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
