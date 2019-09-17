# == Schema Information
#
# Table name: articles
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  def setup
    @user = User.create(username: 'Leroy Jenkins', email: 'leroy.jenkins@chicken.com', password: 'password1234')
  end

  test 'model is not valid when title is missing' do
    article = Article.new(description: 'Description', user: @user)
    assert_not article.valid?
  end

  test 'model is not valid when description is missing' do
    article = Article.new(title: 'My Title', user: @user)
    assert_not article.valid?
  end

  test 'title must have a minimum of 5 characters' do
    article = Article.new(description: 'Description', user: @user)
    article.title = 'a' * 4
    assert_not article.valid?

    article.title = 'a' * 5
    assert article.valid?
  end

  test 'description must have a minimum of 5 characters' do
    article = Article.new(title: 'My Title', user: @user)
    article.description = 'a' * 4
    assert_not article.valid?

    article.description = 'a' * 5
    assert article.valid?
  end
end
