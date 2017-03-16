class CreateDanStats < ActiveRecord::Migration[5.0]
  def change
    create_table :dan_stats do |t|
      t.integer :user_id
      t.integer :dan_id
      t.string :clear
      t.string :score

      t.timestamps
    end
  end
end
