class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.string :song_name
      t.string :artist
      t.string :bpm
      t.string :effect

      t.timestamps
    end
  end
end
