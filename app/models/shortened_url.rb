class ShortenedUrl < ApplicationRecord
	validates :long_url, presence: true, uniqueness: true
	validates :short_url, presence: true, uniqueness: true
	validates :user_id, presence: true

	def self.random_code
		code = SecureRandom.urlsafe_base64
		code = SecureRandom.urlsafe_base64 if ShortenedUrl.exists?(short_url: code)
		code
	end
end