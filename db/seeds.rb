# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require'csv'
require 'faker'

category = Category.create!(name: "Dessert")


20.times do |t|
  product = Product.create!(name: Faker::Dessert.variety, price: 1, categories: [category] , quantity: 2 )
  puts "#{product.name} created!"
   puts "   category: #{product.categories.first.name}"
end

p "Created #{Product.count} desserts"
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
