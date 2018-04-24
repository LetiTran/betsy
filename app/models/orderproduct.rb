class Orderproduct < ApplicationRecord
  # belongs_to :order
  has_many :products

  validates :quantity ,presence: true
end
