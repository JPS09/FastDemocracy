class AddPollIdToOpinions < ActiveRecord::Migration[6.0]
  def change
    add_reference :opinions, :poll, foreign_key: true
  end
end
