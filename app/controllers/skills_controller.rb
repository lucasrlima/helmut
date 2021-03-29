class SkillsController < ApplicationController

    def new
        @profiles = policy_scope(Profile).order(first_name: :asc)
        @job = Job.find(params[:job_id])
        @skill = Skill.new
        authorize @skill
    end
    

end
