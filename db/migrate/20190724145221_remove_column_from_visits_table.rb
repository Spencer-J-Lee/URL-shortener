class RemoveColumnFromVisitsTable < ActiveRecord::Migration[5.2]
	def change
		remove_column :visits, :times_visited
  end
end
