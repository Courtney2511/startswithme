class SessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]
  # layout false



  def new
    @user = User.new
    if current_user
      redirect_to posts_path
    else
      render "new"
    end

  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to posts_path
    else
      @user = User.new
      flash.now[:alert] = "Invalid email or apssword"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path
  end

end
