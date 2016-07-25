class UsersController < ApplicationController
  skip_before_action :require_login, only: [:index, :new, :create]
  # layout false

  # def index
  #   @users = User.all
  # end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to(user_path(@user), notice: 'Profile created!') #root_path is protected to logged in users only.
      # send the user a welcome email
      UserMailer.welcome_email(@user).deliver_later
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :crypted_password, :password, :password_confirmation)
  end

end
