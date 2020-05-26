# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"

# puts "Cleaning database..."
# Review.destroy_all
# Booking.destroy_all
# Sloth.destroy_all
# User.destroy_all
# puts "user: #{User.count}, sloth: #{Sloth.count}, bookings: #{Booking.count}, Reviews: #{Review.count}"

puts "Create database: Table User"


# 3.times do
#   image = Faker::Avatar.image
#   file = URI.open(image)
#   sleep(5)
#   user = User.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name , email: Faker::Internet.email, username: Faker::Internet.username, password: Faker::Internet.password)
#   user.photo.attach(io: file, filename: "#{user.first_name}.png", content_type: 'image/png')
#   user.save
#   sleep(3)
# end

puts "Create database: Table Sloth "

2.times do
  fil = URI.open(Faker::Avatar.image)
  sleep(5)
  sloth = Sloth.new(name: Faker::Hipster.word, address: Faker::Address.street_address, details: Faker::Hipster.paragraph, price: Faker::Number.decimal(l_digits: 2), user_id: rand(User.first.id..User.last.id))
  sloth.photos.attach(io: fil, filename: "#{sloth.name}.png", content_type: 'image/png')
  sloth.save
  sleep(3)
end

# puts "Create database: Table Booking "

# status = ["booked", "available", "reserved"]
# 4.times do
#   booking = Booking.new(user_id: rand(User.first.id..User.last.id), sloth_id: rand(Sloth.first.id..Sloth.last.id), status: status.sample)

#     booking.start_date = start_date = Time.now - (60 * 60 * rand(24..1000))
#     booking.end_date =  end_date = start_date + (60 * 60 * rand(24..200))
#     sloth = Sloth.find_by(id: booking.sloth_id)
#     total_days = (end_date.to_i - start_date.to_i).to_i / (24 * 60 * 60)
#     booking.total_cost = sloth.price * total_days
#     booking.save
#     sleep(3)
# end

# puts "Create database: Table Review "

# 2.times do
#   review = Review.new(content: Faker::Hipster.paragraph, rating: rand(1..5), booking_id: rand(Booking.first.id..Booking.last.id))
#   review.save
# end

puts "Database created!"
