FactoryGirl.define do

  factory :user do
    # first_name Faker::Lorem.words(1)
    # last_name Faker::Lorem.words(1)
    # email Faker::Internet.email
    # location Faker::Lorem.words(4).join("")
    # pswrd = "blahblah"
    # password pswrd

    first_name "Connie"
    last_name "Chang"
    email "connie@connie.com"
    location "1234 Lane"
    password "blahblah"

  end
end
