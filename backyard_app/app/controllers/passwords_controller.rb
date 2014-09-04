class PasswordsController < ApplicationController
  def new
    #render reset password form
  end

  def create
  	user = User.find_by_email(params[:email])

  	if user
      user.set_password_reset
      UserMailer.password_reset(user).deliver
    end
  	redirect_to login_url, notice: "Email was sent with instructions"
  end

  def edit
    @user = User.find_by_code(params[:id])
  end

  def update
    user = User.find_by_code(params[:id])
    reset = params.require(:password).permit(:password, :password_confirmation)

    user.update_attributes(
      :password => reset[:password],
      :password_confirmation => reset[:password_confirmation])

    user[:code] = nil

    redirect_to login_path
  end


end
