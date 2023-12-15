class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_user, only:[:show,:edit,:update,:destroy ]

  def index
    users = User.all
    # render json:  users, status: :ok 
  end

  def new
    user = User.new
    # render json:  @user, status: :ok 
  end

  def create
    @user = User.new(user_params)

    if @user.save
      UserMailer.signup_confirmation(@user.email, @user).deliver_now

      render json: { 
        message: 'User created successfully',
        pin: @user.pin,
        valid_until: @user.valid_until,
        token: @user.token
      }, status: :created
    else
      render json: { error: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # def create
  #   user = User.new(user_params)
  #   if user.save
  #     token = JsonWebToken.encode(user_id: user.id)
  #     render json: { token: token }, status: :created
  #   else
  #     render json: user.errors, status: :unprocessable_entity
  #   end
  # end

  def verify_pin
    @user = User.find_by(email: params[:email], pin: params[:pin])

    if @user.present?
      @user.update(pin: Time.zone.now) 
      render json: { message: 'PIN verification successful' }, status: :ok
    else  
      render json: { error: 'Expired or Invalid PIN ' }, status: :unprocessable_entity
    end
  end

  def login
    # byebug
    user = User.where(email: params[:email], password: params[:password], token: params[:token])

    # if valid_password?(user.password)
    if user
      render json: { message: 'Login successful', user: user}, status: :ok
      # render json:  user, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: @user , status: :ok
    end
  end


  def destroy
    if @user.destroy
      render json: @user , status: :ok
      # redirect_to users_path, notice: "User was successfully destroyed." 
    end
  end


  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :pin, :image)
  end
end