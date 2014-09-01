class RentalsController < ApplicationController

  def index
  end


  def new

  	user_id = params[:user_id]
  	@user = User.find_by_id(user_id)
  	@rental = @user.rentals.new
  end

  def create
  	@user = params[:id] #change to current user when sessions are done

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
