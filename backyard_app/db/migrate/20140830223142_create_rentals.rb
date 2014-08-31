class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.string :title
      t.string :description
      t.string :location
      t.integer :price
      t.string :category
      t.string :image_url

      t.timestamps
    end
  end
end
