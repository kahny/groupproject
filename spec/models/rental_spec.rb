require 'rails_helper'

RSpec.describe Rental, :type => :model do
	it "should test that a rental is saved" do
		bobs_rental = Rental.create(title: "Bob's luxury home", description: "Close to everything", location: "711 711th Street San Francisco", price: 240, category: "pool", image_url: "testurl.com")
		expect(bobs_rental).not_to eq(nil)
	end
end
