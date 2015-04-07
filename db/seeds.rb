require 'faker'
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  ) 
  user.skip_confirmation!
  user.save
end

users = User.all

#Create Topics
15.times do
  topic = Topic.create(
    title: Faker::Lorem.sentence
    )

#create Bookmark
  6.times do 
    Bookmark.create(
      user:     users.sample,
      topic:    topic,
      url:    Faker::Internet.url
      )
  end
end

#create an admin to login
admin = User.new(
  name: 'Admin User',
  email: 'admin@example.com',
  password: 'password',
  )
admin.skip_confirmation!
admin.save

puts "seed finished"
puts "#{Topic.count} Topics created"
puts "#{Bookmark.count} Bookmarks created"
