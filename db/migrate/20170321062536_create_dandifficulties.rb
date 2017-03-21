class CreateDandifficulties < ActiveRecord::Migration[5.0]
  def change
    create_table :dandifficulties do |t|
      t.integer :dan_id
      t.integer :difficulty_id

      t.timestamps
    end
  end
end
