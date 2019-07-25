class User < ApplicationRecord
	validates :email, presence: true, uniqueness: true

	has_many :submitted_urls,
		primary_key: :id,
		foreign_key: :user_id,
		class_name:  :ShortenedUrl

	has_many :visits,
		primary_key: :id,
		foreign_key: :user_id,
		class_name:  :Visit

	has_many :visited_urls,
		through: :visits,
		source:  :short_url

	def recently_submitted_urls
		submitted_urls
			.select('*')
			.where('created_at > ?', 1.hour.ago)
			.order('created_at DESC')
	end
end