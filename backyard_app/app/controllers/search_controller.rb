class SearchController < ApplicationController
 def index
    #find user for nav bar
    @current_user = current_user

    @search = ""

    @search_result = params[:search]

    p @search_result
  end

  def new
  	# loc = params.require(:search)
    loc = params[:search]
    range = params[:range]


# distance buttons need to add up if mutiple
    p "we're getting here"

    @lat_long = Geocoder.coordinates(loc)

    location_arr = []

    @lat_long.each do |location|
      location_arr << location
    end
    if range != nil
      @locations = Rental.near(location_arr, range)
    else
      @locations = Rental.near(location_arr, 10)
    end
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
          :'marker-color'  => '65C18F',
          :'marker-symbol' => 'circle',
          :'marker-size'   => 'medium'

        }
      }
    end
    @features <<  @lat_long


    #Add features array to @geojson to yield markers
    @geojson = JSON.generate({
      type: 'FeatureCollection',
      features: @features
    })

    p @geojson

    render json: @geojson
  end

end
