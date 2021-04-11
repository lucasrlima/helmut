# Preview all emails at http://localhost:3000/rails/mailers/skill_mailer
class SkillMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/skill_mailer/new_skill
  def new_skill
    user = User.first
    job = Job.last
    skill = Skill.last
    SkillMailer.with(user: user, job: job, skill: skill).new_skill
  end

end
