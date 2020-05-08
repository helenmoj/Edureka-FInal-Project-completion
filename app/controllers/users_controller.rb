class UsersController < ApplicationController


  def new
    @user = User.new
  end

 def show
    @user = User.find(params[:id])
  end


  def create
    @user = User.new(user_params)
    @user.email.downcase!
    if @user.save
      flash[:notice] = "Account created successfully!"
      #redirect_to root_path
      redirect_to @user
    else
      flash.now.alert = "Invalid email/password combination."
      render :new
    end
  end

private

def user_params
  # strong parameters - whitelist of allowed fields #=> permit(:name, :email, ...)
  # that can be submitted by a form to the user model #=> require(:user)
  params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
end
  end