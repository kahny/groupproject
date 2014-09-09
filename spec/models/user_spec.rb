require 'rails_helper'

RSpec.describe User, :type => :model do
  # it "should test that user is saved" do
  #  User.create(first_name: "Bob", last_name: "Sanderson", email: "bobby@bob.com", password_digest: "12341234", isOwner: false, location: "location")
  #  bob = User.find_by_first_name("Bob")
  #  expect(bob).not_to eq(nil)
  # end
  subject { FactoryGirl.create(:user) }
  it "should have a valid user" do
    expect(subject).to be_valid
    expect(subject.first_name).to eql("Connie")
  end

  it "should give user a rental" do
  	rental_one = FactoryGirl.create(:rental)
  	subject.rentals << rental_one
  	expect(subject.rentals.length).to eq(1)
  end

end
