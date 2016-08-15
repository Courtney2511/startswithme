class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
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
    @user.profile_picture = Rails.root.join("assets/images/default_user.PNG").open
    if @user.save
      redirect_to(user_path(@user), notice: 'Profile created!') #root_path is protected to logged in users only.
      # send the user a welcome email
      UserMailer.welcome_email(@user).deliver_later
    else
      render :new
    end

# this is only used for the SIGN UP modal
    # @user = User.new(user_params)
    # respond_to do |format|
    #   if @user.save
    #     auto_login(@user)
    #     format.html { redirect_to user_path(@user), notice: 'Profile created!' }
    #     format.json {
    #       render json: {redirect: user_path(@user)}, status: 200
    #     }
    #   else
    #     format.html { render :new }
    #     format.json {
    #       # render json: @user.errors, status: :unprocessable_entity
    #       render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    #     }
    #   end
    # end

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(profile_params)
      flash[:notice] = 'Your profile has been updated'
      redirect_to user_path
    else
      flash[:notice] = 'Your profile was not updated successfully.'
      redirect_to user_path
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :crypted_password, :password, :password_confirmation, :profile_picture)
  end

  def profile_params
    params.require(:user).permit(:profile_picture, :description)
  end
end
