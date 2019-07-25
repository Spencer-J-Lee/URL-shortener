class ShortenedUrl < ApplicationRecord
	validates :long_url, :short_url, :user_id, presence: true
	validates :short_url, uniqueness: true
	validate  :no_spamming, :nonpremium_max

	has_one :submitter,
		primary_key: :user_id,
		foreign_key: :id,
		class_name:  :User

	has_many :visits,
		primary_key: :id,
		foreign_key: :short_url_id,
		class_name:  :Visit

	has_many :visitors,
		-> { distinct },
		through: :visits,
		source:  :visitor

	has_many :taggings,
		primary_key: :id,
		foreign_key: :short_url_id,
		class_name:  :Tagging

	has_many :tag_topics,
		-> { distinct },
		through: :taggings,
		source:  :topic

	def self.random_code
		code = SecureRandom.urlsafe_base64
		code = SecureRandom.urlsafe_base64 while ShortenedUrl.exists?(short_url: code)
		code
	end

	def self.create_from_user_and_url(user, long_url)
		short_url = ShortenedUrl.random_code
		ops_hash  = { long_url: long_url, short_url: short_url, user_id: user.id }
		ShortenedUrl.create!(ops_hash)
	end

	def self.prune(mins)
		ShortenedUrl
			.select('*')
			.where('created_at > ?', mins.minutes.ago)
			.destroy_all
	end

	def num_clicks
		visits.count
	end

	def num_uniques
		visits.select('user_id').distinct.count
	end

	def num_recent_uniques
		visits
			.select('user_id')
			.where('created_at > ?', 10.minutes.ago)
			.distinct
			.count
	end

	def no_spamming
		if submitter.recently_submitted_urls.count >= 5
			errors[:user_id] << "cannot submit more than 5 URLs in one hour."
		end
	end

	def nonpremium_max
		if submitter.premium == false && submitter.submitted_urls.count >= 5
			errors[:user_id] << "cannot submit more than 5 URLs if non-premium."
		end
	end
end