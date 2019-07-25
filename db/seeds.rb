# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creating users"
User.destroy_all
user1 = User.create(email: 'test_email')
user2 = User.create(email: 'another_test_email')

puts "Creating shortened urls"
ShortenedUrl.destroy_all
url1 = ShortenedUrl.create_from_user(user1)
url2 = ShortenedUrl.create_from_user(user2)

puts "Creating visits"
Visit.destroy_all
visit1 = Visit.record_visit!(user1, url1)
visit2 = Visit.record_visit!(user1, url2)
visit3 = Visit.record_visit!(user2, url1)