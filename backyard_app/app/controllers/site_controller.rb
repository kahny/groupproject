class SiteController < ApplicationController

  def index
    #find user for nav bar
    @current_user = current_user
    @search = ""

  end

  def search

  	# loc = params.require(:search)
    loc = params[:search]

    lat_long = Geocoder.coordinates(loc)

    location_arr = []

    lat_long.map do |location|
      location_arr << location
    end

    @locations = Rental.near(location_arr, 30)

    render nothing: true
  end

  def about
  end

  def contact
  end

end
