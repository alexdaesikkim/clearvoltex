class AddTierToDifficulties < ActiveRecord::Migration[5.0]
  def change
  	add_column :difficulties, :tier, :string
  	add_column :difficulties, :effector, :string
  	add_column :userstats, :score, :string
  	add_column :userstats, :sort_string, :string
  	remove_column :songs, :effect
  end
end
