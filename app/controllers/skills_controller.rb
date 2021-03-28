class SkillsController < ApplicationController

    def new
        @profiles = policy_scope(Profile).order(first_name: :asc)
    end
    

end
