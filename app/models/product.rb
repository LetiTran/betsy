class Product < ApplicationRecord
  has_many :orders,through: :orderproduct
  has_and_belongs_to_many :categories, join_table: "category_product"
  has_many :reviews


  validates :name, presence: true, length: { minimum: 1 }
  validate :has_atleast_one_category
  validates_numericality_of :quantity, presence: true, greater_than_or_equal_to: 0
  validates_numericality_of :price, presence: true, greater_than_or_equal_to: 0
  def average_rating
    if (self.reviews).count > 0
          product_reviews = self.reviews
          sum_ratings = 0.0
          product_reviews.each do |review|
            sum_ratings += review.rating
          end
          avg = sum_ratings/(product_reviews.count)
          return avg
        else
          return 0
        end
    # return "No reviews yet" if reviews.count == 0
    # sum = 0.0
    # products.reviews.each do |review|
    #   sum += review.rating
    # end
    # return (sum/reviews.count)
  end

  private
  def has_atleast_one_category

    if categories.empty?
      errors.add(:categories, "must have atleat one category")
    end
  end

end
