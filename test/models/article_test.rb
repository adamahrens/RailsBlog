# == Schema Information
#
# Table name: articles
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test 'model is not valid when title is missing' do
    article = Article.new(description: 'Description')
    assert_not article.valid?
  end

  test 'model is not valid when description is missing' do
    article = Article.new(title: 'My Title')
    assert_not article.valid?
  end

  test 'title must have a minimum of 5 characters' do
    article = Article.new(description: 'Description')
    article.title = 'a' * 4
    assert_not article.valid?

    article.title = 'a' * 5
    assert article.valid?
  end

  test 'description must have a minimum of 5 characters' do
    article = Article.new(title: 'My Title')
    article.description = 'a' * 4
    assert_not article.valid?

    article.description = 'a' * 5
    assert article.valid?
  end
end
