class SiteController < ApplicationController

  def index
    #find user for nav bar
    #MUST FIX - on logout local host is broken
    # if session is active do this
    if @user != nil
      id = current_user.id
      @user = User.find_by_id(id)
    else
      @user = nil
    end
    #otherwise set @user to nil
  end

  def about
  end

  def contact
  end

end
