class AgreementsController < ApplicationController

	def create
		rental_params = params.require(:agreement).permit(:rent_date)
		@agreement = Agreement.new(rental_params)
		@agreement.rental_id = params[:rental_id]
		@agreement.user_id = current_user.id
		@agreement.save
	end

end
