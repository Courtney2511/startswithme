class PasswordResetsController < ApplicationController
  skip_before_filter :require_login

  def new
  end

  #called when a user puts their email into the password reset form
  def create
    @user = User.find_by_email(params[:email])
    #sends an email to the user with password reset instructions (a url with random token)
    @user.deliver_reset_password_instructions! if @user
    flash[:success] = "Instructions have been sent to your email!"
    redirect_to root_path

  end

  #reset password form
  def edit
    @token = params[:id]
    @user = User.load_from_reset_password_token(@token)

    if @user.blank?
      not_authenticated
      return
    end
  end

  #action fired when user sends the password reset form
  def update
    @token = params[:id]
    @user = User.load_from_reset_password_token(@token)

    if @user.blank?
      not_authenticated
      return
    end

    #makes the password confirmation validation work
    @user.password_confirmation = params[:user][:password_confrimation]
    #clears the temporary token and updates the password
    if @user.change_password!(params[:user][:password])
      redirect_to(users_path, :notice => 'Password successfully updated')
    else
      render "edit"
    end
  end

end
