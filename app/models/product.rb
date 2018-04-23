class Product < ApplicationRecord
  has_many :orderproducts
  has_many :orders, through: :orderproducts
  has_and_belongs_to_many :categories, join_table: "category_product"
  has_many :reviews
  belongs_to :merchant

  validates :name, presence: true, length: { minimum: 1 }
  validate :has_at_least_one_category
  validates_numericality_of :quantity, presence: true, greater_than_or_equal_to: 0
  validates_numericality_of :price, presence: true, greater_than_or_equal_to: 0

  def average_rating
    return "No reviews yet" if reviews.count == 0
    sum = 0.0
    self.reviews.each do |review|
      sum += review.rating
    end
    return (sum/reviews.count)
  end

  private
  def has_at_least_one_category
    if categories.empty?
      errors.add(:categories, "must have at_least one category")
    end
  end

end
