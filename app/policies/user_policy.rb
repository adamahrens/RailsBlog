class UserPolicy < ApplicationPolicy
  attr_reader :user, :other

  def initialize(user, other)
    @user = user
    @other = other
  end

  def update?
    @user == @other
  end

  def edit?
    update?
  end

  def destroy?
    @user == @other
  end
end
