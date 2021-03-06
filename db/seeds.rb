# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Creating restaurants'

12.times do
  Restaurant.create(
    name: Faker::RockBand.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.cell_phone,
    category: Restaurant::CATEGORIES.sample
  )
end

puts 'Restaurants created successfully'
puts 'Creating random reviews'

50.times do
  Review.create(
    content: Faker::Lorem.paragraph,
    rating: rand(0..5),
    restaurant: Restaurant.order("RANDOM()").first
  )
end

puts 'Reviews created'
