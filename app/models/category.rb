class Category < ApplicationRecord
  has_many :products, through: :categoryproduct

  validates :name, presence: true, uniqueness: true
  validates :name, length: { in: 1..5 }
end
