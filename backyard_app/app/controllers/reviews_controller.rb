class ReviewsController < ApplicationController
  def index
  end

  def create
    #so we need to figure out how to get the length of reviews AKA Total reviews of either location or owner
    #also how to set up the relations between ratings

    @user = User.find_by_id(params[:user_id])
    @rental = Rental.find_by_id(params[:rental_id])
    review_params = params[:review].permit(:user_id, :rating, :description)
    @review = @rental.reviews.create(review_params)

    render :json => @review

    #Alli: commented this out, now using AJAX
    # redirect_to "/users/#{@rental.user.id}/rentals/#{@rental.id}"
  end

  def show
  end

end
