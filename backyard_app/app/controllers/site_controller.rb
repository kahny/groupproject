class SiteController < ApplicationController

  def index
    #find user for nav bar
    @current_user = current_user
    @search = ""

  end

  def search
  	loc = params.require(:search)
  	lat_long = Geocoder.coordinates(loc)
  	p lat_long
  end

  def about
  end

  def contact
  end

end
