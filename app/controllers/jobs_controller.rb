class JobsController < ApplicationController

  def index
    @job = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    if @job.save
      redirect_to job_path(@job)
    else
      render :new
    end
  end

  def show
    find_job
  end

  def edit
    find_job
  end

  def update
    find_job
    @job.update(job_params)
    redirect_to job_path(@job)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :date, :time, :address,
    :issue, :owner, :contact)
  end

   def find_job
    @job = Job.find(params[:id])
  end

end

