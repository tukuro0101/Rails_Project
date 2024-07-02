# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

 #1.7
 require 'faker'

 # Destroy all existing records to start fresh
 CoffeeShop.destroy_all
 Customer.destroy_all
 Review.destroy_all

 # Create Coffee Shops
 50.times do
   CoffeeShop.create(
     name: Faker::Coffee.unique.blend_name,    # Generate a unique coffee blend name
     location: Faker::Address.full_address,    # Generate a full address
     rating: rand(1.0..5.0).round(1),          # Generate a random rating between 1.0 and 5.0
     description: Faker::Coffee.notes          # Generate coffee notes as a description
   )
 end

 # Create Customers and Reviews
 100.times do
   customer = Customer.create(
     first_name: Faker::Name.first_name,        # Generate a first name
     last_name: Faker::Name.last_name,          # Generate a last name
     email: Faker::Internet.unique.email,       # Generate a unique email address
     favorite_coffee_shop: CoffeeShop.order('RANDOM()').first  # Assign a random favorite coffee shop
   )

   # Generate between 1 to 5 reviews per customer
   rand(1..5).times do
     Review.create(
       customer: customer,                      # Assign the customer
       coffee_shop: CoffeeShop.order('RANDOM()').first,  # Assign a random coffee shop
       rating: rand(1..5),                      # Generate a random rating between 1 and 5
       comment: Faker::Coffee.notes             # Generate coffee notes as a comment
     )
   end
 end
