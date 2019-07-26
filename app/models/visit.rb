class Visit < ApplicationRecord
	validates :user_id, :shortened_url_id, presence: true

	has_one :visitor,
	primary_key: :user_id,
	foreign_key: :id,
	class_name:  :User
	
	has_one :shortened_url,
	primary_key: :shortened_url_id,
	foreign_key: :id,
	class_name:  :ShortenedUrl

	def self.record_visit!(user, shortened_url)
		ops_hash = { user_id: user.id, shortened_url_id: shortened_url.id }
		Visit.create!(ops_hash)
	end
end