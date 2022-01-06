class UpdateOpinionsPollId < ActiveRecord::Migration[6.0]
  def change
    rename_column :opinions, :polls_id, :poll_id
  end
end
