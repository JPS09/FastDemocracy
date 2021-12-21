class AddPollIdToOpinions < ActiveRecord::Migration[6.0]
  def change
    add_reference :opinions, :polls, foreign_key: true, on_delete: :cascade
  end
end
