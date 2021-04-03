class SkillsController < ApplicationController

    def new
        @profiles = policy_scope(Profile).order(first_name: :asc)
        find_job
        @skill = Skill.new
        authorize @skill
    end

    def create
        @skill = Skill.new
        authorize @skill
        find_job
        @skill.job = @job
        
        if @skill.save
            redirect_to job_path(@job)
        end

    end
    
    private

    def skill_params
        params.require(:skill).permit(:job_id, :profile_id)
    end
    
    def find_job
        @job = Job.find(params[:job_id])
    end
    

end
