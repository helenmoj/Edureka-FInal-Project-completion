class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:login][:email].downcase)
    if user && user.authenticate(params[:login][:password])
        session[:user_id] = user.id.to_s
        redirect_to :my_account, :notice => "Logged in!"
    else
      flash.now.alert = "incorrect email or password, try again"
      render :new
      end
  end

  def my_account
    if session[:user_id] != nil
      @sessName = User.find(session[:user_id]).email
    else
      @sessName = "Guest"
    end
  end



  def destroy
    redirect_to login_path, notice: "Logged out!"
  end
  end

