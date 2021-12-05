class AddStatusToPolls < ActiveRecord::Migration[6.0]
  def change
    add_column :polls, :status, :string
  end
end
