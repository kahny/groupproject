class ReviewsController < ApplicationController
  def index
  end

  def create
  	new_review = params.require(:review).permit(
  		:rating,
  		:description)
  	reviewer = User.find_by_id(params[:user_id])
  	rental = Rental.find_by_id(params[#TBD])








  end



end
