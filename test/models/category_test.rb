# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = Category.new(name: 'computers')
  end

  test 'should be valid with a name' do
    assert @category.valid?
  end

  test 'should have a name' do
    @category.name = ''
    assert_not @category.valid?
  end

  test 'names should be unique' do
    @category.save
    @duplicate = Category.new(name: 'computers')
    assert_not @duplicate.valid?
  end

  test 'name should not be too short' do
    @category.name = 'a' * 2
    assert_not @category.valid?
  end

  test 'name should not be too long' do
    @category.name = 'a' * 26
    assert_not @category.valid?
  end
end
