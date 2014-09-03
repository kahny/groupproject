class RentalsController < ApplicationController

  before_action :is_authenticated?

  def index
    @rentals = Rental.all

    #find user for nav bar
    @current_user = current_user

    @agreement = Agreement.new
  end

  def new
    user_id = params[:user_id]
    @user = current_user
    @rental = @user.rentals.new

    if User.find(user_id) != @current_user
      redirect_to root_path
    end
  end

  def create

  	if User.find(params[:user_id]) == current_user
    	new_rental = params.require(:rental).permit(
    		:title,
    		:description,
    		:location,
    		:price,
    		:category,
    		:image_url)
    	rental = Rental.create(new_rental)

      @user = current_user
      @user.rentals << rental
      redirect_to user_rentals_path(new_rental)
    else
      flash[:notice] = "Please login"
      redirect_to login_path
    end

  end

  def destroy
    if User.find(params[:user_id]) == current_user
      rental_id = params[:rental_id]
      rental = find_by_id(rental_id)
      rental.destroy
      redirect_to root_path
      flash[:notice] = "Rental removed"
    else
      session[:user_id] = nil
      redirect_to root_path
    end
  end

  def show
    rental_id = params[:id]
    @rental = Rental.find_by_id(rental_id)

    #creating variable renter to bring renter info to page
    @renter = @rental.user

    @reviews = @rental.reviews
    @review = @rental.reviews.new
    @user = current_user
    #find user for nav bar
    @current_user = current_user

    #create agreement for booking the rental
    @agreement = Agreement.new

  end


end
