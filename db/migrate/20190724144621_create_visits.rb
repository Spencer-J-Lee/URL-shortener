class CreateVisits < ActiveRecord::Migration[5.2]
  def change
		create_table :visits do |t|
			t.integer :user_id, null: false
			t.integer :short_url_id, null: false
			t.integer :times_visited

			t.timestamps
    end
  end
end
