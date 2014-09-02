class SiteController < ApplicationController

  def index
    id = params[:user_id]
    @user = User.find_by_id(id)
  end

  def about
  end

  def contact
  end

end
