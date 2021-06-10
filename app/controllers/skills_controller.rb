class SkillsController < ApplicationController

    def new
        if params[:query].present?
            @profiles = policy_scope(Profile).search_profile_index(params[:query]).where(role: "Fotógrafo")
        else
            @profiles = policy_scope(Profile).where(role: "Fotógrafo").order(first_name: :asc)
        end
        find_job
        @skill = Skill.new
        authorize @skill
    end

    def create
        find_job
        @skill = Skill.new(skill_params)
        authorize @skill
        @skill.job = @job
        
        if @skill.save
            mail = SkillMailer.with(user: @skill.job.user, job: @job, skill: @skill).new_skill.deliver_now
            redirect_to job_path(@job)
        end

    end

    def destroy
        @skill = Skill.find(params[:id])
        authorize @skill
        @skill.destroy
        redirect_to job_path(@skill.job)
    end

    def index
        if current_user.admin && params[:query].present?
            @skills = policy_scope(Skill).skill_global_search(params[:query])
            
        elsif current_user.admin
            @skills = policy_scope(Skill).order(created_at: :asc).limit(20)
            
        elsif current_user.profile.role == "Fotógrafo" && params[:query].present?
            @skills = policy_scope(Skill).where(profile: current_user.profile).skill_global_search(params[:query])
            
        elsif current_user.profile.role == "Fotógrafo"
            @skills = policy_scope(Skill).where(profile: current_user.profile)
            
        elsif current_user.profile.role == 'Jornalista'
            @skills = policy_scope(Skill).where(job: current_user)
        else
            @skills = []
        end
    end

    def show
        find_skill
        authorize @skill
    end
    
    
    private

    def skill_params
        params.require(:skill).permit(:profile_id)
    end
    
    def find_job
        @job = Job.find(params[:job_id])
    end

    def find_skill
        @skill = Skill.find(params[:id])
    end
    
    
end
