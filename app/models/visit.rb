class Visit < ApplicationRecord
	validates :user_id, presence: true
	validates :short_url_id, presence: true

	# Visit::record_visit!(user, shortened_url) 
	# that will create a Visit object recording a visit from a User to the given ShortenedUrl.

	def self.record_visit!(user, shortened_url)
		ops_hash = { user_id: user.id, short_url_id: shortened_url.id }
		Visit.create!(ops_hash)
	end
end