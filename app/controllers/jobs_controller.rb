class JobsController < ApplicationController

  def index
    @job = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new
    @job.save
  end


end
