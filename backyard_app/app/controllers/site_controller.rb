class SiteController < ApplicationController

  def index
    #find user for nav bar
    @current_user = current_user

    @search = ""

  end

  def search
  	# loc = params.require(:search)
    loc = params[:search]

    @lat_long = Geocoder.coordinates(loc)

    location_arr = []

    @lat_long.each do |location|
      location_arr << location
    end

    @locations = Rental.near(location_arr, 30)


    @features = Array.new

    #Go through locations db and push into features array
    @locations.each do |location|
      @features << {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [location.longitude, location.latitude]
        },
        properties: {
          address: location.location,
          url:  user_rental_path(location.user_id, location.id),
          title: location.title,
          description: location.description,
          price: location.price,
          image_url: location.image_url,
          :'marker-color'  => '#00607d',
          :'marker-symbol' => 'circle',
          :'marker-size'   => 'medium'
        }
      }
    end

    p @features

    #Add features array to @geojson to yield markers
    @geojson = JSON.generate({
      type: 'FeatureCollection',
      features: @features
    })

    p @geojson

    render json: @geojson
  end

  def about
  end

  def contact
  end

end
