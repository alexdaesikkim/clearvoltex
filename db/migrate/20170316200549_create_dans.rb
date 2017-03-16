class CreateDans < ActiveRecord::Migration[5.0]
  def change
    create_table :dans do |t|
      t.string :name
      t.integer :level
      t.integer :first_song_id
      t.integer :second_song_id
      t.integer :third_song_id
      t.string :photo
      t.date :release_date

      t.timestamps
    end
  end
end
