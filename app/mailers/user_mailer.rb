class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.newjob.subject
  #
  def newjob
    @user = params[:user] # Instance variable => available in view
    @job = params[:job]
    mail(to: @user.email, subject: 'Nova Pauta de Foto')
  end
end
