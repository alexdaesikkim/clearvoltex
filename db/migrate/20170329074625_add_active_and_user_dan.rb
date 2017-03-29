class AddActiveAndUserDan < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :dan, :integer, default: 0
  	add_column :difficulties, :active, :boolean, default: true
  	add_column :dans, :active, :boolean, default:true
  end
end
