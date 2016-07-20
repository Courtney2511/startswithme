class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(current_user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "Signed in!"
      # send the user a welcome email
      UserMailer.welcome_email(@user).deliver_later
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
