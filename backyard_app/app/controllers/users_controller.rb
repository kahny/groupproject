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

  def edit
    user_id = params[:id]
    @user = User.find_by_id(user_id)
  end

  def update
    if session[:user_id] == nil
      redirect_to root_path
    else
      @current_user = User.find_by_id(session[:user_id])
    end
    user_id = params[:id]
    res = params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :image_url)
    user = User.find_by_id(user_id)

    user.update_attributes(
      :first_name => res[:first_name],
      :last_name  => res[:last_name],
      :email      => res[:email],
      :image_url  => res[:image_url])
    redirect_to "/users/#{user_id}"
  end

  def show
    user_id = params[:id]
    @user = User.find_by_id(user_id)
  end
end
