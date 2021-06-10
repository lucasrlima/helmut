class PaymentsController < ApplicationController

    def new
        find_skill
        @payment = Payment.new
    end
    

    private

    def payment_params
        params.require(:payment).permit(:fee, :skill_id)
    end

    def find_skill
         @skill = Skill.find(params[:id])
    end

end
