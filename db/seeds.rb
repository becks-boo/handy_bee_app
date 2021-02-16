# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

user1 = User.new(
  user_name: "Bob Builder",
  email: "bob@gmail.com",
  password: "123456",
  address: "Berlin, Kreuzberg",
  role: "Painter",
  qualifications: "Painter, Builder"
  )

image_1 = URI.open('https://images.unsplash.com/photo-1577033169343-75977941abdd?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=900&ixid=MXwxfDB8MXxyYW5kb218fHx8fHx8fA&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
user1.picture.attach(io: image_1, filename: "#{user1.user_name}", content_type: 'image/png')

user1.save!

business1 = Business.new(
  user_id: user1,
  name: "Painting",
  description: "Painting for the walls",
  category: "Home repairing"
  )

business_img = URI.open('https://images.unsplash.com/photo-1613288030301-b448aa439640?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=900&ixid=MXwxfDB8MXxyYW5kb218fHx8fHx8fA&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600')
business1.picture.attach(io: business_img, filename: "#{business1.name}", content_type: 'image/png')

business1.save!
