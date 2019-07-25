class Tagging < ApplicationRecord
	validates :tag_topic_id, :short_url_id, presence: true

	has_one :short_url,
		primary_key: :short_url_id,
		foreign_key: :id,
		class_name:  :ShortenedUrl

	has_one :topic,
		primary_key: :tag_topic_id,
		foreign_key: :id,
		class_name:  :TagTopic
end