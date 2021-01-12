class AddStatusApprovedToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :status_approved, :boolean
  end
end
