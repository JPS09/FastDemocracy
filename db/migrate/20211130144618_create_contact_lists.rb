class CreateContactLists < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_lists do |t|
      t.references :contact, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
