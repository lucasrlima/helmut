# Preview all emails at http://localhost:3000/rails/mailers/job_mailer
class JobMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/job_mailer/newjob
  def newjob
    user = User.first
    job = Job.last
    UserMailer.with(user: user, job: job).newjob
  end

end
