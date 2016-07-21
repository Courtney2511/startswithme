class PasswordResetsController < ApplicationController
  skip_before_filter :require_login

  #called when a user puts their email into the password reset form
  def create
    @user = User.find_by_email(params[:email])
    #sends an email to the user with password reset instructions (a url with random token)
    @user.deliver_reset_password_instructions! if @user
    redirect_to(users_path, :notice => 'Instructions have been sent to your email' )

  end

  #reset password form
  def edit
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])

    if @user.blank?
      not_authenticated
      return
    end
  end

  #action fired when user sends the password reset form
  def update
    @token = params[:id]
    @user = User.load_from_reset_password_token(params[:id])

    if @user.blank?
      not_authenticated
      return
    end

    #makes the password confirmation validation work
    @user.password_confirmation = [:user][:password_confrimation]
    #clears the temporary token and updates the password
    if @user.change_password!(params[:user][:password])
      redirect_to(users_path, :notice => 'Password successfully updated')
    else
      render :action => "edit"
    end
  end

end
