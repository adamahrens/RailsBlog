# frozen_string_literal: true

# Handles logging a User in/out
class SessionsController < ApplicationController
  def new; end

  def login
    user = User.find_by(email: params[:email].downcase)
    if user&.authenticate(params[:password])
      logger.debug 'Good credentials'
      session[:user_id] = user.id
      cookies.encrypted[:username] = user.username
      cookies.encrypted[:email] = user.email
      flash[:success] = "You've logged in"
      redirect_to user
    else
      logger.debug 'Bad credentials'
      render 'new'
    end
  end

  def logout
    session[:user_id] = nil
    cookies[:username] = nil
    cookies[:email] = nil
    flash[:success] = "You've logged out"
    redirect_to root_path
  end
end
