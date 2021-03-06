class UserMailer < ActionMailer::Base
  default from: "noreply@homebass.ca"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reset_password_email.subject
  #

  def welcome_email(user)
    @user = user
    mail(to: @user.email,
         subject: 'Welcome to homebass.ca')
  end

  def reset_password_email(user)
    @user = user
    @url  = edit_password_reset_url(user.reset_password_token, host: 'homebass.ca')
    mail(to: user.email,
         subject: "Homebass: Password reset request")
  end
end
