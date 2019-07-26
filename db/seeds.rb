# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'database_cleaner'
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

puts "Creating users"
User.destroy_all
user1 = User.create(email: 'test_email_premium', premium: true)
user2 = User.create(email: 'test_email')

puts "Creating shortened urls"
ShortenedUrl.destroy_all
url1 = ShortenedUrl.create_from_user_and_long_url(user1, 'test_short_url_1')
url2 = ShortenedUrl.create_from_user_and_long_url(user2, 'test_short_url_2')
url3 = ShortenedUrl.create_from_user_and_long_url(user2, 'test_short_url_3')

puts "Creating visits"
Visit.destroy_all
visit1 = Visit.record_visit!(user1, url1)
visit2 = Visit.record_visit!(user1, url2)
visit3 = Visit.record_visit!(user1, url2)
visit4 = Visit.record_visit!(user1, url3)
visit5 = Visit.record_visit!(user1, url3)
visit6 = Visit.record_visit!(user1, url3)

puts "Creating tag topics"
TagTopic.destroy_all
topic = TagTopic.create!(topic: 'test_topic')

puts "Creating taggings"
Tagging.destroy_all
tag1 = Tagging.create!(tag_topic_id: 1, short_url_id: 1)
tag2 = Tagging.create!(tag_topic_id: 1, short_url_id: 2)
tag3 = Tagging.create!(tag_topic_id: 1, short_url_id: 3)

