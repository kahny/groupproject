class User < ActiveRecord::Base
	has_many :rentals, :through => :rental_users, dependent: :destroy
	has_many :rental_users

	has_many :reviews, :through => :review_users, dependent: :destroy
	has_many :review_users
	validates :email,
		:presence => true,
		:uniqueness => true,
		:format => {:with => /\A[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})\z/}

	validates :password_digest,
		:presence => true,
		:confirmation => true,
		:length => { minimum: 6 }, on: :create

	validates :first_name,
		:presence => true

	validates :last_name,
		:presence => true


	validates :isOwner,
		:inclusion => {:in => [true, false]}

	#add more specifics for location
	validates :location,
		:presence =>true

end
