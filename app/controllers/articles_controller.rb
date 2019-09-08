# frozen_string_literal
class ArticlesController < ApplicationController
  def index
    @articles = Article.recent
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = 'Article created successfully'
      redirect_to articles_path
    else
      flash[:danger] = 'Unable to create the Article'
      render 'new'
    end
  end

  private

  def article_params
    params.require(:article)
          .permit(:title, :description)
  end
end
