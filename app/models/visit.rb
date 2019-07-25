class Visit < ApplicationRecord
	validates :user_id, :short_url_id, presence: true

	has_one :visitor,
	primary_key: :user_id,
	foreign_key: :id,
	class_name:  :User
	
	has_one :short_url,
	primary_key: :short_url_id,
	foreign_key: :id,
	class_name:  :ShortenedUrl

	def self.record_visit!(user, shortened_url)
		ops_hash = { user_id: user.id, short_url_id: shortened_url.id }
		Visit.create!(ops_hash)
	end
end