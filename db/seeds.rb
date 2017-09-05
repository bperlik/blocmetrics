require 'faker'

# Create Users
3.times do
  user = User.new(
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(8)
  )
  user.skip_confirmation!
  user.save!
end

users = User.all

# Create Registered Applications
5.times do
  RegisteredApplication.create!(
    user: users.sample,
    name: Faker::Lorem.word,
    url: Faker::Internet.url
  )

end

registered_applications = RegisteredApplication.all

# Create Events
50.times do
  Event.create!(
    registered_application: registered_applications.sample,
    name: Faker::Lorem.word
  )
end

events = Event.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{RegisteredApplication.count} registered applications created"
puts "#{Event.count} events created"
