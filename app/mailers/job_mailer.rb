class JobMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.job_mailer.newjob.subject
  #
  def newjob
    @user = params[:user] # Instance variable => available in view
    @job = params[:job]
    mail(to: @job.user.email, bcc: 'ldlima@uolinc.com',  subject: 'Nova Pauta de Foto')
  end

  def job_updated
    @user = params[:user] 
    @job = params[:job]
    mail(to: @job.user.email, bcc: 'ldlima@uolinc.com',  subject: 'Pauta de Foto atualizada')
  end

end
