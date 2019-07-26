# == Schema Information
#
# Table name: tag_topics
#
#  id    :bigint           not null, primary key
#  topic :string           not null
#

class TagTopic < ApplicationRecord
	validates :topic, presence: true, uniqueness: true

	has_many :taggings,
		primary_key: :id,
		foreign_key: :tag_topic_id,
		class_name:  :Tagging

	has_many :tagged_urls,
		-> { distinct },
		through: :taggings,
		source:  :shortened_url

	def popular_links
		tagged_urls.joins(:visits)
      .group(:shortened_url, :long_url)
      .order('COUNT(visits.id) DESC')
      .select('long_url, shortened_url, COUNT(visits.id) as number_of_visits')
      .limit(5)
	end
end
