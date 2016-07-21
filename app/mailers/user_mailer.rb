class UserMailer < ApplicationMailer
  default from: 'startswithmeapp@gmail.com'

  def welcome_email(user)
    @user = user
    mail(to: user.email, subject: "Welcome!")
  end

  def reset_password_email(user)
    @user = User.find user.id
    @url = edit_password_reset_url(@user.reset_password_token)
    mail(to: user.email), subject: "Your Password Has Been Reset"
  end

end
