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
        @payment.total = @skill.fee + @payment.spending
        if @payment.save 
            redirect_to skill_path(@skill)
        end
    end
    
    def index
        @payments = policy_scope(Payment)
        
    end
    

    private

    def payment_params
        params.require(:payment).permit(:skill_id, :spending, :total)
    end

    def find_skill
        @skill = Skill.find(params[:skill_id])
    end

    def find_payment
        @payment = Payment.find(params[:payment_id])
    end
    
end
