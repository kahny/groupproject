require 'rails_helper'

RSpec.describe ReviewsController, :type => :controller do

  describe "GET index" do
    it "returns http success" do
    	User.create(first_name: "Bob", last_name: "Sanderson", email: "bobby@bob.com", password_digest: "12341234", isOwner: false, location: "location")
      get :index
      expect(response).to be_success
    end
  end



end
