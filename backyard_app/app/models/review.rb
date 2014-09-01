class Review < ActiveRecord::Base
	belongs_to :reviewable, polymorphic: true
	has_many :users, :through => :review_users, dependent: :destroy
	has_many :review_users

validates :rating,
	:presence => true,
	:numericality => { :greater_than => 0, :less_than_or_equal_to => 5}

end



