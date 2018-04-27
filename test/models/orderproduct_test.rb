require "test_helper"

describe Orderproduct do
  let(:orderproduct) { Orderproduct.new quantity: 2, product_id: Product.first.id, order_id: Order.first.id }

  describe "validations" do
    it "must be valid" do
      orderproduct.must_be :valid?
    end

    it "must have a product" do
      orderproduct.product = nil

      orderproduct.valid?.must_equal false
      orderproduct.errors.must_include :product
    end
  end
end
