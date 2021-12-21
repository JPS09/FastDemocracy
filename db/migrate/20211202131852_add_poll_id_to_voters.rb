class AddPollIdToVoters < ActiveRecord::Migration[6.0]
  def change
    add_column :voters, :poll_id, :integer
    add_foreign_key :voters, :polls, on_delete: :cascade
    add_foreign_key :opinions, :polls, on_delete: :cascade
    add_foreign_key :questions, :answers, on_delete: :cascade
    add_foreign_key :answers, :questions, on_delete: :cascade
  end
end
