class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
    	#added user_id for renter or rentee who wrote the review
    	t.integer :user_id
      t.integer :rating
      t.text :description
      t.references :reviewable, polymorphic: true
      t.timestamps

    end
  end
end
