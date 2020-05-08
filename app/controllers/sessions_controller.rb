class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:login][:email].downcase)
    if user && user.authenticate(params[:login][:password])
   #   user = User.find_by(email: params[:session][t(:email)].downcase)
    #  if user && user.authenticate(params[:session][t(:password)])
        session[:user_id] = user.id.to_s
        #redirect_to '/show'
        redirect_to root_path, notice: 'successfully logged in'
      #redirect_to admin_new_path, notice: 'successfully logged in'
  # redirect_to user
    else
      flash.now.alert = "incorrect email or password, try again"
      render :new
      end
      end



  def destroy
    redirect_to login_path, notice: "Logged out!"
  end
  end

