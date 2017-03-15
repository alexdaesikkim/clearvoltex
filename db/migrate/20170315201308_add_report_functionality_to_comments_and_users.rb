class AddReportFunctionalityToCommentsAndUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :comments, :reports, :integer, default: 0
  	add_column :votes, :report, :boolean, default: false
  end
end
