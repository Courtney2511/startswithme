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

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = 'Your profile picture has been updated'
      redirect_to user_path
    else
      flash[:notice] = 'Your profile picture was not updated successfully.'
      redirect_to user_path
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :crypted_password, :password, :password_confirmation, :profile_picture)
  end

end
