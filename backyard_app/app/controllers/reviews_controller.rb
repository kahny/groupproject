class ReviewsController < ApplicationController
  def index
  end

  def create

    review_params = params[:review].permit(:rating, :description)
    review_params[:user_id] = current_user.id

    if params[:rental_id]
      @rental = Rental.find_by_id(params[:rental_id])
      @review = @rental.reviews.create(review_params)


    else
      @user = User.find_by_id(params[:user_id])
      @review = @user.reviews.create(review_params)


    end


    #sending json back to ajax call
    render json: @review

    # respond_to do |f|
    #   f.html { redirect_to rentals_path}
    #   f.json { render json: @review }
    # end
  end

  def show
  end

end
