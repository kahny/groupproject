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
  	@user = User.create(new_user)

    if @user.valid?
      redirect_to root_path
    else
      @errors = @user.errors.full_messages
      render new_user_path
    end


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

    @user_reviews = @user.reviews || []
    @new_user_review = @user.reviews.new


    #find user for nav bar
    @current_user = current_user

    # will pull all the owners agreements from the agreement table
    rental_ids = @user.rentals.map(&:id)
    @owners_agreements = Agreement.where(rental_id: rental_ids)


    @owners_denied_agreements = Agreement.where(rental_id: rental_ids, approved: false)
    @owners_pending_agreements = Agreement.where(rental_id: rental_ids, approved: nil)
    @owners_approved_agreements = Agreement.where(rental_id: rental_ids, approved: true)

    # anyone who has put in a request (in the agreement table)
    @renters_agreements = Agreement.where(user_id: @current_user)
    @renters_denied_agreements = Agreement.where(user_id: @current_user, approved: false)
    @renters_approved_agreements = Agreement.where(user_id: @current_user, approved: true)
    @renters_pending_agreements = Agreement.where(user_id: @current_user, approved: nil)

  end
end
