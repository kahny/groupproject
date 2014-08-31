require 'ffaker'

pics = ["http://media-cache-ec0.pinimg.com/736x/74/86/37/748637dfe0c9cbef96278660fe0f1fe7.jpg", "http://media-cache-ak0.pinimg.com/736x/06/8b/d5/068bd5ddb4a8b001633702155b6e8c1d.jpg", "http://media-cache-ec0.pinimg.com/736x/04/84/c6/0484c6d34561914eb6f74fb8502dee83.jpg", "http://images.meredith.com/content/dam/bhg/Images/2006/05/100028804.jpg.rendition.largest.jpg", "http://images.meredith.com/content/dam/bhg/Images/2006/05/100028795.jpg.rendition.largest.jpg", "http://images.meredith.com/content/dam/bhg/Images/2006/05/100028824.jpg.rendition.largest.jpg", "http://images.meredith.com/content/dam/bhg/Images/2006/05/100028798b.jpg.rendition.largest.jpg", "http://images.meredith.com/content/dam/bhg/Images/2006/05/100028797b.jpg.rendition.largest.jpg", "http://images.meredith.com/content/dam/bhg/Images/2006/05/100028806.jpg.rendition.largest.jpg", "http://media-cache-ec0.pinimg.com/736x/15/57/8e/15578e3e6bd5f41fb3fd23a0162fbdcb.jpg"]
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
end

