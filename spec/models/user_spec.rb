require 'rails_helper'

RSpec.describe User, :type => :model do
  it "should test that user is saved" do
   User.create(first_name: "Bob", last_name: "Sanderson", email: "bobby@bob.com", password_digest: "12341234", isOwner: false, location: "location")
   bob = User.find_by_first_name("Bob")
   expect(bob).not_to eq(nil)
  end
end
