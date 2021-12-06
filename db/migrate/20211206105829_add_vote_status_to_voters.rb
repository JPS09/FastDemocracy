class AddVoteStatusToVoters < ActiveRecord::Migration[6.0]
  def change
    add_column :voters, :has_voted, :boolean
  end
end
