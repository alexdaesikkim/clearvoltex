class CreateUserstats < ActiveRecord::Migration[5.0]
  def change
    create_table :userstats do |t|
      t.integer :user_id
      t.integer :difficulty_id
      t.string :clear

      t.timestamps
    end
  end
end
