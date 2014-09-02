class ReviewsController < ApplicationController
  def index
  end

  def create
  	new_review = params.require(:review).permit(
  		:rating,
  		:description)

# wondering is this is the correct id or if it should be current user
  	reviewer = User.find_by_id(params[:user_id])
  	rental = Rental.find_by_id(params[:id])

#so we need to figure out how to get the length of reviews AKA Total reviews of either location or owner

#also how to set up the relations between ratings


  end
end
