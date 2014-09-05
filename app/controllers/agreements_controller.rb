class AgreementsController < ApplicationController

	def create
		rental_params = params.require(:agreement).permit(:rent_date)
		@agreement = Agreement.new(rental_params)
		@agreement.rental_id = params[:rental_id]
		@agreement.user_id = current_user.id
		@agreement.save

    flash[:rental_saved] = "Your request has been sent!"
    redirect_to user_path(current_user)
	end

  def update
    rental_params = params.require(:agreement).permit(:approved)
    agreement = current_user.agreements.find_by_id(params[:id])
    if params["decline"]
        agreement.approved = false
      end
      if params["approve"]
        agreement.approved = true
      end
    agreement.update rental_params
    render json: agreement, status: 200


  end

  def show
    agreement_params = params[:agreement].permit(:approved)

    agreement_id = params[:id]
    agreement = Agreement.find(agreement_id)
      if params["decline"]
        agreement.approved = false
      end
      if params["approve"]
        agreement.approved = true
      end
    agreement.save

    # update attributes
    @agreement = @agreement.approved.update_attributes(agreement_params)

    render json: @agreement
  end

end
