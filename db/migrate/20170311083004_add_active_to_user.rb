class AddActiveToUser < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :active, :boolean, default: false
  	add_column :users, :ban, :boolean, default: false
  end
end
