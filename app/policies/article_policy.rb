class ArticlePolicy < ApplicationPolicy
  attr_reader :user, :article

  def initialize(user, article)
    @user = user
    @article = article
  end

  def update?
    @article.user == @user
  end

  def edit?
    update?
  end

  def destroy?
    @article.user == @user
  end
end
