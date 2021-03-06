# frozen_string_literal: true

# Articles controller for fetching, creating, destroying Articles
class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  before_action :require_user, except: %i[show index]

  def index
    @articles = Article.recent
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:success] = 'Article created successfully'
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
    authorize @article
  end

  def update
    authorize @article
    if @article.update(article_params)
      flash[:success] = 'Article updated successfully'
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    authorize @article
    result = @article.destroy!
    flash[:success] = "Article #{result.title} destroyed"
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article)
          .permit(:title, :description, category_ids: [])
  end
end
