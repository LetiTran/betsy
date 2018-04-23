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

<<<<<<< HEAD
p "Created #{Product.count} desserts"
<<<<<<< HEAD
=======
p "**Created #{Merchant.count} merchants**"
>>>>>>> a8bb6e39a663bebb847271ee5e0eefa1e3aded9e


# Products
puts "\n"
10.times do |t|
  product = Product.create!(name: Faker::Dessert.variety, price: 1, categories: [Category.order("RANDOM()").first] , quantity: 2, merchant_id: Merchant.order("RANDOM()").first.id )
  puts "#{product.name} created in the category: #{product.categories.first.name}"
end

<<<<<<< HEAD
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
=======
p "**Created #{Product.count} desserts**"
>>>>>>> a8bb6e39a663bebb847271ee5e0eefa1e3aded9e
