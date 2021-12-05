class AddPollIdToVoters < ActiveRecord::Migration[6.0]
  def change
    add_column :voters, :poll_id, :integer
    add_foreign_key :voters, :polls
  end
end
