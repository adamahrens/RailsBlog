# frozen_string_literal: true

# Class to handle Users
class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      cookies.encrypted[:username] = @user.username
      cookies.encrypted[:email] = @user.email
      flash[:success] = 'User created/logged in successfully'
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def show; end

  def edit
    authorize @user
  end

  def update
    authorize @user
    if @user.update(user_params)
      flash[:success] = 'User updated successfully'
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
