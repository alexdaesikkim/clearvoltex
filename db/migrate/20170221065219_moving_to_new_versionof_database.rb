class MovingToNewVersionofDatabase < ActiveRecord::Migration[5.0]
  def change
  	add_column :difficulties, :tier, :string
  	add_column :difficulties, :effect, :string
  	add_column :userstats, :sort_string, :string

  	remove_column :songs, :effect
  end
end
