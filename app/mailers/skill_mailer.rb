class SkillMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.skill_mailer.new_skill.subject
  #
  def new_skill
    @skill = params[:skill]
    @user = params[:user] # Instance variable => available in view
    @job = params[:job]
    mail(to: @skill.profile.user.email, bcc: 'ldlima@uolinc.com',  subject: 'Pauta de Foto UOL: ' + @job.title )
  end
end
