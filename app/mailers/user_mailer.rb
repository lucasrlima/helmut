class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.newjob.subject
  #
  def welcome
    @user = params[:user] # Instance variable => available in view
    mail(to: @user.email, subject: 'Willkommen in Helmut!')
    # This will render a view in `app/views/user_mailer`!
  end
end
