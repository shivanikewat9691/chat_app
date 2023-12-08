class AccountsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @accounts = Account.all
    # render json:  accounts, status: :ok
  end

  def new
    @account = Account.new
    # render json:  account, status: :ok
  end

  def show
    @account = Accounts.find(params[:id])
  end
  
  def create
    @account = Account.new(account_params)
    if @account.save
      # redirect_to accounts_path, notice: "Acoount was successfully created." 
      render json: @account , status: :ok
    else
      render json: { error: @account.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private 

  def account_params
    params.require(:account).permit(:first_name, :last_name, :city, :password)
  end
end