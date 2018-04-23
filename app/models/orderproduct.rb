class Orderproduct < ApplicationRecord
  belongs_to :order
  belongs_to :product
<<<<<<< HEAD
=======

  validates :quantity ,presence: true

>>>>>>> order_product
end
