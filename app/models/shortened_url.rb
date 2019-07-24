class ShortenedUrl < ApplicationRecord
	validates :long_url, presence: true, uniqueness: true
	validates :short_url, presence: true, uniqueness: true
	validates :user_id, presence: true

	def self.random_code
		code = SecureRandom.urlsafe_base64
		code = SecureRandom.urlsafe_base64 while ShortenedUrl.exists?(short_url: code)
		code
	end

	def self.create_from_user(user)
		short_url = ShortenedUrl.random_code
		ops_hash  = { long_url: user.email, short_url: short_url, user_id: user.id }
		ShortenedUrl.create!(ops_hash)
	end

	has_one :submitter,
		primary_key: :user_id,
		foreign_key: :id,
		class_name:  :User

	has_many :visits,
		primary_key: :id,
		foreign_key: :short_url_id,
		class_name:  :Visit
end