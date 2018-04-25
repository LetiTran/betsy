class Orderproduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity ,presence: true

  def self.create_orderproduct(quantity, product_id, order_id)
    orderproduct = Orderproduct.new
    orderproduct.quantity = quantity
    orderproduct.product_id = product_id
    orderproduct.order_id = order_id
    return orderproduct
  end
  
  def total_price
    self.quantity * self.product.price
  end




end
