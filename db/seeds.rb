# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require'csv'
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

  category = Category.create!(name: Faker::Dessert.topping)
  puts "#{category.name} created!"
p "Created #{Category.count} categories"


# Products
20.times do |t|
  product = Product.create!(name: Faker::Dessert.variety, price: 1, categories: [Category.first] , quantity: 2 )
  puts "#{product.name} created!"
   puts "   category: #{product.categories.first.name}"
end

p "Created #{Product.count} desserts"
<<<<<<< HEAD


# Mercahnts
5.times do |t|
  merchant = Merchant.create!(username: Faker::Name.name, email: Faker::Internet.email )
  puts "#{merchant.username} created!"
end

p "Created #{Merchant.count} merchants"
=======
REVIEW_FILE = Rails.root.join('db','seeds', 'reviews.csv')
puts "Loading raw review data from #{REVIEW_FILE}"

review_failures = []
CSV.foreach(REVIEW_FILE, :headers => true) do |row|
  review = Review.new
  review.rating = row['rating']
  review.product_id = row['product_id']
  puts "Created review: #{review.inspect}"
  successful = review.save
  if !successful
    puts review.errors
    review_failures << review
  end
end

puts "Added #{Review.count} review records"
puts "#{review_failures.length} reviews failed to save"
p review_failures
puts
>>>>>>> product_controller
