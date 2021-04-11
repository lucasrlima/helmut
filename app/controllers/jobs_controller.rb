class JobsController < ApplicationController
  before_action :find_job, only: [:show, :edit, :update, :destroy]

  def index
    #@job = Job.all
    if current_user.admin
      @jobs = policy_scope(Job).order(title: :asc).limit(20)
    else
      @jobs = policy_scope(Job).where(user: current_user).order(title: :asc).limit(10)
    end

  end

  def new
    @job = Job.new
    authorize @job
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    authorize @job
    if @job.save
      mail = JobMailer.with(user: @job.user, job: @job).newjob.deliver_now
      
      redirect_to job_path(@job)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @job.update(job_params)
    redirect_to job_path(@job)
  end

  def destroy
    @job.destroy
    redirect_to jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :date, :time, :address,
    :issue, :owner, :contact)
  end

  def find_job
    @job = Job.find(params[:id])
    authorize @job
  end

end

