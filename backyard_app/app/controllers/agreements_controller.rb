class AgreementsController < ApplicationController

	def create
		rental_params = params.require(:agreement).permit(:rent_date)
		@agreement = Agreement.new(rental_params)
		@agreement.rental_id = params[:rental_id]
		@agreement.user_id = current_user.id
		@agreement.save
		redirect_to root_path
	end

  def update
    # CREATE ROUTE!!!
    rental_id =
    agreement = Agreement.find_by_user_id()

  end

end
