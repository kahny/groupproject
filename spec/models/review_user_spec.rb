require 'rails_helper'

RSpec.describe ReviewUser, :type => :model do
	it "should test that a review is saved in relation to a user" do
		#create a user
		bob =  User.create(first_name: "Bob", last_name: "Sanderson", email: "bobby@bob.com", password_digest: "12341234", isOwner: true, location: "location")
		#create a valid review
		bobs_review = Review.create(rating: 4, description: "So close to so good but not bad")
		#assign bobs review to bob
		bob.reviews << bobs_review
		#check for relationship between bob and his review
		expect(bob.reviews).not_to eq(nil)
		expect(bobs_review.users).not_to eq(nil)
	end


end
