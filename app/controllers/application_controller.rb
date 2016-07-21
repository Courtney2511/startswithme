class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #requires that users be logged in to perform actions, unless expections are noted on the proper controllers
  before_action :require_login

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

end
