require "test_helper"

describe Product do
  let(:product) { Product.new name: "thing", price: 1, category: "red", quantity: 2 }

  it "must be valid" do
    product.must_be :valid?
  end

  it "must have a name" do
    product.name = nil

    product.valid?.must_equal false
    product.errors.must_include :name
  end

  it "must have name length greater than zero" do
    product.name = ""

    product.valid?.must_equal false
    product.errors.must_include :name
  end

  it "must have a category" do
    product.category = nil

    product.valid?.must_equal false
    product.errors.must_include :category
  end

  it "must have category length greater than zero" do
    product.category = ""

    product.valid?.must_equal false
    product.errors.must_include :category
  end

  it "must have a quantity" do
    product.quantity = nil

    product.valid?.must_equal false
    product.errors.must_include :quantity
  end

  it "must not have a quantity less than zero" do
    product.quantity = -1

    product.valid?.must_equal false
    product.errors.must_include :quantity
  end

  it "must have a price" do
    product.price = nil

    product.valid?.must_equal false
    product.errors.must_include :price
  end

  it "must not have a price less than zero" do
    product.price = -2

    product.valid?.must_equal false
    product.errors.must_include :price
  end
end
