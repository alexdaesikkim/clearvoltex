class CreateReplies < ActiveRecord::Migration[5.0]
  def change
    create_table :replies do |t|
	  t.integer :parent_comment_id
      t.integer :child_comment_id

      t.timestamps
    end
  end
end
