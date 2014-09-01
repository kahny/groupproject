class RentalsController < ApplicationController

  before_action :is_authenticated?

  def index
  end


  def new
    @user = current_user
    @rental = @user.rentals.new

    if User.find(params[:user_id]) != @current_user
      redirect_to root_path
    end
  end

  def create

  	if User.find(params[:user_id]) == current_user
    	new_rental = params.require(:rental).permit(
    		:title,
    		:description,
    		:address,
    		:price,
    		:catagory,
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


end
