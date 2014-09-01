class SiteController < ApplicationController

  def index
    id = current_user.id
    @user = User.find(id)
  end

  def about
  end

  def contact
  end

end
