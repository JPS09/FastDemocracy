class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.references :question, null: false, foreign_key: true, on_delete: :cascade
      t.string :content

      t.timestamps
    end
  end
end
