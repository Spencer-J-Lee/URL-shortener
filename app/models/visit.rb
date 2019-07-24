class Visit < ApplicationRecord
	validates :user_id, presence: true
	validates :short_url_id, presence: true
end