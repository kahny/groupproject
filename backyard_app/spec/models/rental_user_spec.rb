# require 'rails_helper'

# RSpec.describe RentalUser, :type => :model do
# 	it "should test that a rental is saved in relation to user" do
# 		#create a user
# 		bob =  User.create(first_name: "Bob", last_name: "Sanderson", email: "bobby@bob.com", password_digest: "12341234", isOwner: false, location: "location")
# 		#create a valid rental
# 		bobs_rental = Rental.create(title: "Bob's luxury home", description: "Close to everything", location: "711 711th Street San Francisco", price: 240, category: "pool", image_url: "testurl.com")
# 		#assign bobsrental to bob
# 		bob.rentals << bobs_rental
# 		#check for relationship between bob and his rental
# 		expect(bob.rentals).not_to eq(nil)
# 		expect(bobs_rental.users).not_to eq(nil)
# 	end

# 	#should only be able to assign bob to a rental if isOwner is true, need to add this into validation
# end
