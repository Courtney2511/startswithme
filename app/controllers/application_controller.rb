class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #requires that users be logged in to perform actions, unless expections are noted on the proper controllers
  before_action :require_login



  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
  end

  helper_method :current_user

  def ensure_logged_in
    unless current_user
      flash[:alert] = "Please log in"
      redirect_to new_session_url
    end
  end
end
