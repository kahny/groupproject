class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :description
      t.references :reviewable, polymorphic: true
      t.timestamps
    end
  end
end
