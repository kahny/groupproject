class AddDateAndApprovalToAgreements < ActiveRecord::Migration
  def change
  	add_column :agreements, :rent_date, :string
    add_column :agreements, :approved, :boolean
  end
end
