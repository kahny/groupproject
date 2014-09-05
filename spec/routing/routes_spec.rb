require 'rails_helper'

RSpec.describe 'routing to user review', :type => :routing do
	it "routes /users/:user_id to users#show" do
		expect(:get => "/users/16").to route_to(
			:controller => "users",
			:action => "show",
			:id => "16"
			)
			end
		end