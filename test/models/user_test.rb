# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'model is not valid when username is missing' do
    user = User.new(email: 'hello@goodbye.com')
    assert_not user.valid?
  end

  test 'model is not valid when email is missing' do
    user = User.new(username: 'username')
    assert_not user.valid?
  end

  test 'username must have a minimum of 5 characters' do
    user = User.new(email: 'hello@goodbye.com')
    user.username = 'a' * 4
    assert_not user.valid?

    user.username = 'a' * 5
    assert user.valid?
  end

  test 'email must be a valid email' do
    user = User.new(username: 'username')
    user.email = 'a' * 4
    assert_not user.valid?

    user.email = 'email@aol.com'
    assert user.valid?
  end
end
