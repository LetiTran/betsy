require "test_helper"

describe Product do
  let(:product) { Product.new name: "thing", price: 1, quantity: 2, categories: [Category.first, Category.last] }

  describe 'Validations' do
    it "must be valid" do
      product.must_be :valid?
    end

    it "must have at least one category" do
      product.categories.delete_all

      product.valid?.must_equal false
      product.errors.must_include :categories
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

  describe 'relations' do
    it "has a list of orders" do
      product.must_respond_to :orders

      product.orders.each do |order|
        order.must_be_kind_of Order
      end
    end

    it "has a list of categories" do
      product.must_respond_to :categories

      product.categories.each do |category|
        category.must_be_kind_of Category
      end
    end

    it "has a list of reviews" do
      product.must_respond_to :reviews

      product.reviews.each do |review|
        review.must_be_kind_of Review
      end
    end

  end

end
