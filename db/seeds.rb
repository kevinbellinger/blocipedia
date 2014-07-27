# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

kevin = User.new(
  name:     'Kevin',
  email:    'kevin@example.com',
  password: 'helloworld',

)
kevin.skip_confirmation!
kevin.save


caitlin = User.new(
  name:     'Caitlin',
  email:    'caitlin@example.com',
  password: 'helloworld',

)
caitlin.skip_confirmation!
caitlin.save

# Create Extra Users
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


 # Create Generic Wiki's
 50.times do
   Wiki.create(
     user:   users.sample,
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
 end
 wikis = Wiki.all
 
 
 puts "Seed finished"
 puts "#{Wiki.count} wikis created"

