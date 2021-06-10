class PaymentsController < ApplicationController

    def new
        @payment = Payment.new
        authorize @payment
    end
    
    def create
        @payment = Payment.new(payment_params)
        authorize @payment
    end
    

    private

    def payment_params
        params.require(:payment).permit(:fee, :skill_id)
    end

    def find_skill
        @skill = Skill.find(params[:id])
    end

end
