# == Schema Information
#
# Table name: taggings
#
#  id               :bigint           not null, primary key
#  tag_topic_id     :integer          not null
#  shortened_url_id :integer          not null
#

class Tagging < ApplicationRecord
	validates :tag_topic_id, :shortened_url_id, presence: true

	has_one :shortened_url,
		primary_key: :shortened_url_id,
		foreign_key: :id,
		class_name:  :ShortenedUrl

	has_one :topic,
		primary_key: :tag_topic_id,
		foreign_key: :id,
		class_name:  :TagTopic
end
