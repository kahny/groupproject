class Rental < ActiveRecord::Base
	has_many :reviews, as: :reviewable
	has_many :users, :through => :rental_users, dependent: :destroy
	has_many :rental_users

	validates :title,
		:presence => true

	validates :description,
		:presence => true

	#may need to add regex specification later
	validates :location,
		:presence => true

	validates :price,
		:presence => true,
		:numericality => true

	validates :category,
		:presence => true
		#add regex for specific categories?

end
