class SiteController < ApplicationController

  def index
    #find user for nav bar
    @current_user = current_user

  end

  def about
  end

  def contact
  end

end
