class TagTopic < ApplicationRecord
	validates :topic, presence: true, uniqueness: true

	has_many :taggings,
		primary_key: :id,
		foreign_key: :tag_topic_id,
		class_name:  :Tagging

	has_many :tagged_urls,
		-> { distinct },
		through: :taggings,
		source:  :short_url
end