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
puts "\n"
10.times do |t|
    category = Category.create(name: Faker::Dessert.topping)
  until category.name do
      category = Category.create!(name: Faker::Dessert.topping)
  end
  puts "#{category.name} created!"
end
p "**Created #{Category.count} categories**"

# Mercahnts
puts "\n"
10.times do |t|
    merchant = Merchant.create(username: "#{Faker::Name.first_name}#{t}", email: Faker::Internet.email )
  until merchant.username do
    merchant = Merchant.create!(username: "#{Faker::Name.name}#{t}", email: Faker::Internet.email )
  end
  puts "#{merchant.username} created!"
end
p "**Created #{Merchant.count} merchants**"


# Products
puts "\n"
10.times do |t|
  product = Product.create!(name: Faker::Dessert.variety, price: 1, categories: [Category.order("RANDOM()").first] , quantity: 2, merchant_id: Merchant.order("RANDOM()").first.id )
  puts "#{product.name} created in the category: #{product.categories.first.name}"
end
p "**Created #{Product.count} desserts**"


# Reviews
REVIEW_FILE = Rails.root.join('db','seeds', 'reviews.csv')
CSV.foreach(REVIEW_FILE, :headers => true) do |row|
 review = Review.create(rating: row['rating'],  product_id: row['product_id'] )
 puts "Review #{review.id} created with rating #{review.rating}"
end
