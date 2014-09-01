class SessionController < ApplicationController
  def new
    #login form
  end

  def create
    #where auth happens
    @user = User.authenticate(params[:user][:email], params[:user][:password])

    if @user
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.now[:notice] = "There was a problem with your username or password"
      render :new
    end
  end

  def destroy
  end
end
