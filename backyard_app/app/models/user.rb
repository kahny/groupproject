class User < ActiveRecord::Base
	has_secure_password

	has_many :rentals, dependent: :destroy
	has_many :reviews, as: :reviewable, dependent: :destroy
	has_many :agreements, dependent: :destroy

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


	# validates :isOwner,
	# 	:inclusion => {:in => [true, false]}

	#add more specifics for location
	# validates :location,
	# 	:presence =>true


	def set_password_reset
	  self.code = SecureRandom.urlsafe_base64
	  self.expires_at = 4.hours.from_now
	  self.save!
	end

	def self.authenticate email, password
		User.find_by_email(email).try(:authenticate, password)
	end



end
