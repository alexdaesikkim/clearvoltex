class AddReportFunctionalityToCommentsAndUsers < ActiveRecord::Migration[5.0]
  def change
  	unless column_exists? :comments, :reports
  		add_column :comments, :reports, :integer, default: 0
  	end
  	unless column_exists? :votes, :report
  		add_column :votes, :report, :boolean, default: false
  	end
  end
end
