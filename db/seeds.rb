# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

category = Category.create!(name: "Dessert")


20.times do |t|
  product = Product.create!(name: Faker::Dessert.variety, price: 1, categories: [category] , quantity: 2 )
  puts "#{product.name} created!"
   puts "   category: #{product.categories.first.name}"
end

p "Created #{Product.count} desserts"
