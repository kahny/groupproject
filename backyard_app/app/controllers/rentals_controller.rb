class RentalsController < ApplicationController

  def index
  end


  def new
  	@user = params[:id]
  	@rental = @user.rental.new
  end

  def create
  	@user = params[:id] #change to current user

  	new_rental = params.require(:rental).permit(
  		:title,
  		:description,
  		:address,
  		:price,
  		:catagory,
  		:image_url)
  	rental = Rental.create(new_rental)

  	@user.rentals << rental


  	redirect_to user_rentals_path(new_rental)
  end


end
