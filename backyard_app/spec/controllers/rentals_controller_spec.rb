require 'rails_helper'

RSpec.describe RentalsController, :type => :controller do

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to redirect_to(login_path)
    end
  end

end
