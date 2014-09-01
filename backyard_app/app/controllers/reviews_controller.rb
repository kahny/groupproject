class ReviewsController < ApplicationController
  def index
  end

  def create
  	new_review = params.require(:review).permit(
  		:rating,
  		:description)
  end

end
