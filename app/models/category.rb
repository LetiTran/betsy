class Category < ApplicationRecord
  has_and_belongs_to_many :products
  
  validates :name, presence: true, uniqueness: true
  validates :name, length: { in: 1..5 }
end
