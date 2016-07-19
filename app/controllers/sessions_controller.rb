class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user #&& user.authenticate(params[:password]) - can only use this method when using bycrypt.
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in!!"
    else
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to users_url, notice: "Logged out!"
  end

end
