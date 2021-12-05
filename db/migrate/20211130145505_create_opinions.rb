class CreateOpinions < ActiveRecord::Migration[6.0]
  def change
    create_table :opinions do |t|
      t.references :question, null: false, foreign_key: true
      t.references :answer, null: false, foreign_key: true
      t.references :voter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
