class Review < ApplicationRecord
  belongs_to :product

  validates :rating, numericality: { in: 1..5 }
end
