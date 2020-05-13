class ApplicationController < ActionController::Base

  helper_method :current_user
  helper_method :logged_in?

  protect_from_forgery with: :exception
  include SessionsHelper


  # Define the current_user method:
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def after_sign_in_path_for(user)
    stored_location_for(user) || welcome_path
  end

  def logged_in?
    !current_user.nil?
  end
end