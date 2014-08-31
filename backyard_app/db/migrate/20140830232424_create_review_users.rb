class CreateReviewUsers < ActiveRecord::Migration
  def change
    create_table :review_users do |t|
      t.integer :user_id
      t.integer :review_id


      t.timestamps
    end
  end
end
