class RemoveIndexFromShortUrlInShortenedUrlClass < ActiveRecord::Migration[5.2]
	def change
		remove_index :shortened_urls, :long_url
		add_index :shortened_urls, :long_url
  end
end
