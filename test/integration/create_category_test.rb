require 'test_helper'

class CreateCategoryTest < ActionDispatch::IntegrationTest
  test 'can get the new category form and create a category' do
    get new_category_path
    assert_template 'categories/new'
    assert_difference -> { Category.count } do
      post categories_path, params: { category: { name: 'computers' } }
      follow_redirect!
    end

    assert_template 'categories/index'
    assert_match 'computers', response.body
  end

  test 'invalid category submission results in a failure' do
    get new_category_path
    assert_no_difference -> { Category.count } do
      post categories_path, params: { category: { name: '  ' } }
    end

    assert_template 'categories/new'
  end
end
