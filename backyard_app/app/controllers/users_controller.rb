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
  		:password_digest,
  		:image_url,
  		:isOwner,
  		:location)
  	user = User.create(new_user)

  	redirect_to user_path(user)
  end
end
