class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.integer :user_id #owner of rental
      t.string :title
      t.string :description
      t.string :location
      t.float :latitude
      t.float :longitude
      t.integer :price
      t.string :category
      t.string :image_url
      t.timestamps
    end
  end
end
