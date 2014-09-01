class Rental < ActiveRecord::Base
	has_many :reviews, as: :reviewable
	belongs_to :user, dependent: :destroy
	has_many :agreements

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
