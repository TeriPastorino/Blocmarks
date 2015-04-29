require 'faker'
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# 5.times do
#   user = User.new(
#     name:     Faker::Name.name,
#     email:    Faker::Internet.email,
#     password: Faker::Lorem.characters(10)
#   ) 
#   user.skip_confirmation!
#   user.save
# end

# users = User.all

# #Create Topics
# 15.times do
#   topic = Topic.create(
#     title: Faker::Lorem.sentence(3),
#     user:  users.sample,
#     )

# #create Bookmark
#   6.times do 
#     Bookmark.create(
#       topic:    topic,
#       url:    Faker::Internet.url
#       )
#   end
# end

teri = User.new(
  name: "Teri",
  email: "tpasto@comcast.net",
  password: "password",
  )
teri.skip_confirmation!
teri.save


#create an admin to login
admin = User.new(
  name: 'Admin User',
  email: 'admin@example.com',
  password: 'password',
  )
admin.skip_confirmation!
admin.save

#users = User.all

{
  "E Learning" => %w{https://bloc.io http://treehouse.com http://codeacademy.com http://codeschool.com}
}.each do |topic_name, bookmark_urls|
  topic = Topic.create(title: topic_name, user: teri)
  bookmark_urls.each do |url|
    Bookmark.create(
      topic: topic,
      url: url
      )
  end
end

{
  "Gardens" => %w{https://yougrowgirl.com http://.eastbaywilds.com http://englishgardens.com http://gardendesign.com}
}.each do |topic_name, bookmark_urls|
  topic = Topic.create(title: topic_name, user: admin)
  bookmark_urls.each do |url|
    Bookmark.create(
      topic: topic,
      url: url
      )
  end
end

#removed faker data to explicity create data
# 5.times do
#   user = User.new(
#     name:     Faker::Name.name,
#     email:    Faker::Internet.email,
#     password: Faker::Lorem.characters(10)
#   ) 
#   user.skip_confirmation!
#   user.save
# end

#removed to explicitly create data
#Create Topics
# 15.times do
#   topic = Topic.create(
#     title: Faker::Lorem.sentence(3),
#     user:  users.sample,

#     )

# #create Bookmark
#   6.times do 
#     Bookmark.create(
#       topic:    topic,
#       url:    Faker::Internet.url
#       )
#   end
# end
puts "seed finished"
puts "#{Topic.count} Topics created"
puts "#{Bookmark.count} Bookmarks created"
