require 'ffaker'
require 'rubygems'
require 'nokogiri'


user_photos = ["https://avatars3.githubusercontent.com/u/7664271?v=2&s=460", "https://avatars1.githubusercontent.com/u/7417042?v=2&s=400", "https://avatars3.githubusercontent.com/u/7505018?v=2&s=460", "https://avatars1.githubusercontent.com/u/6566275?v=2&s=460","https://avatars2.githubusercontent.com/u/7580547?v=2&s=400","https://avatars0.githubusercontent.com/u/5177175?v=2&s=400","https://avatars2.githubusercontent.com/u/6865075?v=2&s=400","https://avatars3.githubusercontent.com/u/7432747?v=2&s=400","https://avatars1.githubusercontent.com/u/7015675?v=2&s=400","https://avatars3.githubusercontent.com/u/2193430?v=2&s=400","https://avatars0.githubusercontent.com/u/4283352?v=2&s=400","https://avatars2.githubusercontent.com/u/7121497?v=2&s=400","https://avatars0.githubusercontent.com/u/7342658?v=2&s=400","https://avatars0.githubusercontent.com/u/7833470?v=2&s=400","https://avatars1.githubusercontent.com/u/8052705?v=2&s=400","https://avatars1.githubusercontent.com/u/4994741?v=2&s=400","https://avatars2.githubusercontent.com/u/134332?v=2&s=400","https://avatars3.githubusercontent.com/u/1442018?v=2&s=400","https://avatars1.githubusercontent.com/u/2488196?v=2&s=400"]
pics = ["http://www.nox-mag.com/wp-content/uploads/2014/05/amazing-cedar-lane-house-exterior-fabulous-backyard-with-pool.jpg","http://www.randomne55.com/wp-content/uploads/2012/12/insane-pool.jpg","http://www.busydoor.co/images/2012/04/Backyard-with-Pool-for-Modern-House-Design.jpg","http://apsp.org/Portals/0/images/Vacation%20spot%20-%20pool%201.jpg","http://gardeningstudio.com/wp-content/uploads/Backyard-Pool-Landscaping-Ideas-30.jpg","http://www.topdreamer.com/wp-content/uploads/2013/05/Backyard-Pool-3-634x424.jpg","http://cdn.homeidea.pics/images/slodive.com/wp-content/uploads/2012/09/backyard-design-ideas/luxury-custom-pool.jpg","http://home-mu.com/wp-content/uploads/2013/07/backyard-swimming-pool-84.jpg","http://plantnj.com/images/backyard%20pool%20waterfall/backyard-lighting-design-for-swimming-pool-waterfall-area-new-jersey.jpg","http://www.busydoor.co/images/2012/04/Fascinating-Backyard-with-Pool-Design-Ideas.jpg","http://www.topdreamer.com/wp-content/uploads/2013/05/Backyard-Pool-13-634x422.jpg","http://decoratingplan.com/wp-content/uploads/2014/06/backyard-with-pool-landscaping-ideas.jpg","http://media-cache-ec0.pinimg.com/736x/74/86/37/748637dfe0c9cbef96278660fe0f1fe7.jpg", "http://media-cache-ak0.pinimg.com/736x/06/8b/d5/068bd5ddb4a8b001633702155b6e8c1d.jpg", "http://media-cache-ec0.pinimg.com/736x/04/84/c6/0484c6d34561914eb6f74fb8502dee83.jpg", "http://images.meredith.com/content/dam/bhg/Images/2006/05/100028804.jpg.rendition.largest.jpg", "http://images.meredith.com/content/dam/bhg/Images/2006/05/100028795.jpg.rendition.largest.jpg", "http://images.meredith.com/content/dam/bhg/Images/2006/05/100028824.jpg.rendition.largest.jpg", "http://images.meredith.com/content/dam/bhg/Images/2006/05/100028798b.jpg.rendition.largest.jpg", "http://images.meredith.com/content/dam/bhg/Images/2006/05/100028797b.jpg.rendition.largest.jpg", "http://images.meredith.com/content/dam/bhg/Images/2006/05/100028806.jpg.rendition.largest.jpg", "http://media-cache-ec0.pinimg.com/736x/15/57/8e/15578e3e6bd5f41fb3fd23a0162fbdcb.jpg"]
prof = ["https://avatars3.githubusercontent.com/u/7664271?v=2&s=460", "https://avatars1.githubusercontent.com/u/7417042?v=2&s=400", "https://avatars3.githubusercontent.com/u/7505018?v=2&s=460", "https://avatars1.githubusercontent.com/u/6566275?v=2&s=460"]
categories = ["pool", "backyard", "BBQ"]
prices = [500, 560, 570, 400, 250, 300, 350, 330, 70, 90, 110]
rating = [1, 2, 3, 4, 5]

(1..15).each do
  user_params = Hash.new
  user_params[:first_name] = Faker::Name.first_name
  user_params[:last_name] = Faker::Name.last_name
  user_params[:email] = Faker::Internet.email
  user_params[:password_digest] = Faker::Internet.password(6)
  user_params[:isOwner] = true
  user_params[:location] = Faker::Address.street_address
  user_params[:image_url] = prof.sample
  new_user = User.create(user_params)

  (1..15).each do
    new_rental = Rental.new
    new_rental.title = Faker::HipsterIpsum.words(rand(4..8)).join(" ").titleize
    new_rental.description = Faker::HipsterIpsum.paragraph[0..249]
    new_rental.location = Faker::Address.street_address
    new_rental.price = prices.sample
    new_rental.category = categories.sample
    new_rental.image_url = pics.sample

    new_rental.save
    new_user.rentals.push new_rental
  end

  (1..15).each do
      review_params = Hash.new
      review_params[:rating] = rating.sample
      review_params[:description] = Faker::HipsterIpsum.paragraph[0..50]

      new_review = Review.create(review_params)
      new_user.reviews.push new_review
  end

    #Using nokogiri to add locations from peets location file
    page = Nokogiri::HTML(open("./db/findpeets.html"))
        results = []

    page =  page.xpath("//input[starts-with(@id, 'fullAddress')and
        'fullAddress' = translate(@id, '0123456789', '') and
          string-length(@id) > 2
        ]").collect {|node| node['value']}


    page.each do |x|
      results << x
    end

    #Adding peets locations to rental locations
    Rental.all.each_with_index do |place, i|
      # puts "adding location: " + results[i % results.length]
      place.location = results[i % results.length];
      place.save
    end

    #Adding user photo urls to user profiles
    User.all.each_with_index do |photo, i|
      photo.image_url = user_photos[i % user_photos.length];
      photo.save
    end




end

