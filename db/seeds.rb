# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'faker'

User.destroy_all
Business.destroy_all
Booking.destroy_all
Review.destroy_all

image_1 = URI.open('https://images.unsplash.com/photo-1577033169343-75977941abdd?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=900&ixid=MXwxfDB8MXxyYW5kb218fHx8fHx8fA&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')

10.times do
user = User.new(
  user_name: Faker::Name.name,
  email: Faker::Internet.email,
  password: "123456",
  address: Faker::Address.city,
  role: "Contractor",
  qualifications: Faker::Construction.trade,
  )

# user.picture.attach(io: image_1, filename: "file.png", content_type: 'image/png')
user.save
puts "Creating #{user.user_name}"
end

customer = User.create(
  user_name: Faker::Name.name,
  email: Faker::Internet.email,
  password: "123456",
  address: Faker::Address.city,
  role: "Customer"
  )

10.times do
business1 = Business.new(
  user: User.where(role: "Contractor").sample,
  name: Faker::Company.name,
  description: Faker::Construction.subcontract_category,
  category: Faker::Construction.role
  )

business_img = URI.open('https://images.unsplash.com/photo-1613288030301-b448aa439640?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=900&ixid=MXwxfDB8MXxyYW5kb218fHx8fHx8fA&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
business1.pictures.attach(io: business_img, filename: "#{business1.name}", content_type: 'image/png')

business1.save!
puts "creating #{business1.name}"
end

booking = Booking.create(
  price: 55,
  start_date: Date.today,
  end_date: Date.tomorrow,
  confirmed: true,
  business: Business.first,
  user: customer
  )

Review.create(
  booking: booking,
  content: "Awesome",
  rating: 5,
  user: customer
  )








