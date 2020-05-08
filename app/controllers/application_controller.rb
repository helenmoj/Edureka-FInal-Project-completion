class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  include SessionsHelper

  #helper_method :current_user
  #helper_method :current_admin


  # Define the current_user method:
  def current_user
    # Look up the current user based on user_id in the session cookie:
    #@current_user ||= User.find(session[:user_id]) if session[:user_id]
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    ##  @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end

  def after_sign_in_path_for(user)
    stored_location_for(user) || welcome_path
  end

  def logged_in?
    !current_user.nil?
  end
end