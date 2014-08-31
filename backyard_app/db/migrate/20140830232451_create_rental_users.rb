class CreateRentalUsers < ActiveRecord::Migration
  def change
    create_table :rental_users do |t|
      t.integer :user_id
      t.integer :rental_id


      t.timestamps
    end
  end
end
