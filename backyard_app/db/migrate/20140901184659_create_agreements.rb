class CreateAgreements < ActiveRecord::Migration
  def change
    create_table :agreements do |t|
      t.integer :rental_id
      t.integer :user_id #rentee

      t.timestamps
    end
  end
end
