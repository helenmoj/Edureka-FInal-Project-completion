class AccountsController < ApplicationController

  def index
  end

  def new
    @account = Account.new
  end

  def show
    @account = Account.find(params[:id])
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      redirect_to @account
    else
      render 'new'
    end
  end
end


private

def account_params
  params.require(:account).permit(:first_name, :last_name, :birthday, :start_year, :mobile_number, :avatar)
end