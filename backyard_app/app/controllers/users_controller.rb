class UsersController < ApplicationController

  def index
  	@users = User.all
  end

  def new
  	@user = User.new

  end

  def create
  	new_user = params.require(:user).permit(
  		:first_name,
  		:last_name,
  		:email,
  		:password,
  		:image_url,
  		:isOwner,
  		:location)
  	user = User.create(new_user)

  	redirect_to root_path
  end
end
