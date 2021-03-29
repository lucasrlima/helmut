class SkillsController < ApplicationController

    def new
        @profiles = policy_scope(Profile).order(first_name: :asc)
        @skill = Skill.new
        authorize @skill
    end
    

end
