class Product < ApplicationRecord
  has_many :orders, through: :orderproduct
  has_many :categories, through: :categoryproduct
  has_many :reviews

  validates :name, presence: true, length: { minimum: 1 }
  validates :category, presence: true, length: { minimum: 1 }
  validates_numericality_of :quantity, presence: true, greater_than_or_equal_to: 0
  validates_numericality_of :price, presence: true, greater_than_or_equal_to: 0
end
