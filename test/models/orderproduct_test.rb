require "test_helper"

describe Orderproduct do
  let(:orderproduct) { Orderproduct.new quantity: 2, product_id: Product.first.id, order_id: Order.first.id }

  it "must be valid" do
    orderproduct.must_be :valid?
  end
end
