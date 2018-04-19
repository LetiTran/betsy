class Product < ApplicationRecord
  has_many :orders, through: :orderproduct
  has_many :categories, through: :categoryproduct
  has_many :reviews

  validates :name, presence: true
  validates :category, presence: true
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
