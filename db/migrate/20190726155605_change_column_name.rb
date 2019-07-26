class ChangeColumnName < ActiveRecord::Migration[5.2]
	def change
		rename_column :taggings, :short_url_id, :shortened_url_id
		rename_column :visits, :short_url_id, :shortened_url_id
		rename_column :shortened_urls, :short_url, :shortened_url
  end
end
