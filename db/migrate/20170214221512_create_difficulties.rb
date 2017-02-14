class CreateDifficulties < ActiveRecord::Migration[5.0]
  def change
    create_table :difficulties do |t|
      t.integer :song_id
      t.string :difficulty_name
      t.integer :level
      t.string :photo

      t.timestamps
    end
  end
end
