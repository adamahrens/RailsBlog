class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery
  helper_method :current_user, :logged_in?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user != nil
  end

  def require_user
    unless logged_in?
      flash[:error] = 'You must be logged in to perform that action'
      redirect_to root_path
    end
  end

  private

  def user_not_authorized
    flash[:error] = "You're not authorized"
    redirect_to root_path
  end
end
