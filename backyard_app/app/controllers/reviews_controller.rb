class ReviewsController < ApplicationController
  def index
  end

  def create
    review_params = params[:review].permit(:rating, :description)
    review_params[:user_id] = current_user.id

    @rental = Rental.find_by_id(params[:rental_id])
    @review = @rental.reviews.create(review_params)

    #sending json back to ajax call
    render :json => @review
  end

  def show
  end

end
