require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(username: 'ljenkins', email: 'roy.jenkins@aol.com', password: 'password1234')
    @article = Article.create(title: 'First article', description: 'my first article ever', user: @user)
  end

  test 'should get index' do
    get articles_path
    assert_response :success
  end
end
