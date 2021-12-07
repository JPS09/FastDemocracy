class RemoveExpiryAndDeletionAndReplaceWithDatetimeObjects < ActiveRecord::Migration[6.0]
  def change
    remove_column :polls, :expiry_date
    remove_column :polls, :deletion_date
    add_column :polls, :expiry_date, :datetime
    add_column :polls, :deletion_date, :datetime
  end
end
