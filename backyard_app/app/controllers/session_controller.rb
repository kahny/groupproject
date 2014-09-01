class SessionController < ApplicationController
  def new
    #login form
    if session[:user_id] != nil
      redirect_to root_path
    end
  end

  def create
    #where auth happens
    @user = User.authenticate(params[:user][:email], params[:user][:password])

    if @user
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.now[:notice] = "There was a problem with your email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:logged_out] = "You're logged out."
    redirect_to login_path
  end
end
