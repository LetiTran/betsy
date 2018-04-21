# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

# Categories:
  category = Category.create!(name: "Caramel")
  puts "#{category.name} created!"

  category = Category.create!(name: "Gummy")
  puts "#{category.name} created!"

  category = Category.create!(name: "Cakes")
  puts "#{category.name} created!"

  category = Category.create!(name: Faker::Dessert.topping)
  puts "#{category.name} created!"

p "Created #{Category.count} categories"

# Mercahnts
5.times do |t|
  merchant = Merchant.create!(username: "#{Faker::Name.name}#{t}", email: Faker::Internet.email )
  puts "#{merchant.username} created!"
end

p "Created #{Merchant.count} merchants"


# Products
10.times do |t|
  product = Product.create!(name: Faker::Dessert.variety, price: 1, categories: [Category.first] , quantity: 2, merchant_id: Merchant.first.id )
  puts "#{product.name} created!"
   puts "   category: #{product.categories.first.name}"
end

p "Created #{Product.count} desserts"
