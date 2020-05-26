# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"

50.time do
  file = URI.open(Faker::Avatar.image)
  user = User.new(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name , email: Faker::Internet.email, username: Faker::Internet.username, encrypted_password: Faker::Internet.password)
  user.photo.attach(io: file)
end

20.time do
  file = URI.open(Faker::Avatar.image)
  sloth = Sloth.new(name: Faker::Hipster.word, address: Faker::Address.street_address, details: Faker::Hipster.paragraph , price: Faker::Number.decimal(l_digits: 2), user_id: rand(1..50) photo:)
  sloth.photos.attach(io: file)
end


30.times do
  booking = Booking.new(user_id: rand(1..50), sloth_id: rand(1..20), start_date: Faker::Date.in_date_period, end_date: Faker::Date.in_date_period)
    end_date = booking.start_date + rand(1..30)

    sloth = Sloth.find_by(id: booking.sloth_id)
    total_days = end_date - start_date
    booking.total_cost = sloth.price * total_days
end

20.times do
  Review.new(content: Faker::Hipster.paragraph, rating: rand(1..5), booking_id: rand(1..30))
end
