class UserMailer < ActionMailer::Base
  default from: 'everybody@appacademy.io'

  def welcome_email(user)
    @user = user
    @url = "99cats.io"
    mail(to: user.username, subject: "Welcome to 99Cats!")
  end
end
