class Tagging < ApplicationRecord
	validates :tag_topic_id, :short_url_id, presence: true
end