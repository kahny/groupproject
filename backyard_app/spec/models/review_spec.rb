require 'rails_helper'

RSpec.describe Review, :type => :model do
	it "should test that a review is saved" do
		bobs_review = Review.create(rating: 4, description: "So close to so good but not bad")
		expect(bobs_review).not_to eq(nil)

	end
end
