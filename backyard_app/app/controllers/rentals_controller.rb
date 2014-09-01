class RentalsController < ApplicationController

  def index
  end


  def new

  	user_id = params[:user_id]
  	@user = User.find_by_id(user_id)
  	@rental = @user.rentals.new
  end

  def create
  	user_id = params[:user_id] #change to current user when sessions are done
  	@user = User.find_by_id(user_id)
  	new_rental = params.require(:rental).permit(
  		:title,
  		:description,
  		:location,
  		:price,
  		:category,
  		:image_url)
  	my_rental = Rental.create(new_rental)

  	@user.rentals << my_rental


  	redirect_to user_rentals_path(my_rental)
  end


end
