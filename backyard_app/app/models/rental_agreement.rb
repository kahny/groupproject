class RentalAgreement < ActiveRecord::Base
	belongs_to :user #rentee
	belongs_to :rental
end
