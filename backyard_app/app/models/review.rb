class Review < ActiveRecord::Base
	belongs_to :reviewable, polymorphic: true
	belongs_to :user

validates :rating,
	:presence => true,
	:numericality => { :greater_than => 0, :less_than_or_equal_to => 5}

end



