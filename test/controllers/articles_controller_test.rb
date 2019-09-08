require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get articles_path
    assert_response :success
  end

  test 'should get new' do
    get new_article_path
    assert_response :success
  end
end
