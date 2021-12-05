class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.references :poll, null: false, foreign_key: true
      t.string :title
      t.text :content
      t.boolean :mandatory
      t.string :question_type

      t.timestamps
    end
  end
end
