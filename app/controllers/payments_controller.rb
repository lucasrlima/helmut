class PaymentsController < ApplicationController

    def new
        find_skill
        @payment = Payment.new
        authorize @payment
    end
    
    def create
        find_skill
        @payment = Payment.new(payment_params)
        authorize @payment
        @payment.skill = @skill
        if @payment.save 
            redirect_to skill_path(@skill)
        end
    end
    

    private

    def payment_params
        params.require(:payment).permit(:fee, :skill_id)
    end

    def find_skill
        @skill = Skill.find(params[:skill_id])
    end

end
