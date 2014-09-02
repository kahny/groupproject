class SiteController < ApplicationController

  def index
    id = current_user.id
    @user = User.find_by_id(id)
    @current_user = current_user

  end

  def about
  end

  def contact
  end

end
