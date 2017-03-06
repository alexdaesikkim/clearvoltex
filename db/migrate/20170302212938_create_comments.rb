class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :difficulty_id
      t.text :content
      t.integer :rating, default: 0
      t.boolean :pinned, default: false
      t.boolean :approved, default: true

      t.timestamps
    end
  end
end
