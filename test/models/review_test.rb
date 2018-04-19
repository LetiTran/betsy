require "test_helper"

describe Review do
  let(:review) { Review.new rating:1,comment:"hdjdjhjj", product_id: (Product.create name:"candy",category:"sweets",quantity:3).id }

  it "must be valid" do
    product = Product.create name:"candy",category:"sweets",quantity:3
    review.product.must_be :valid?
  end

  it "must be have a rating" do
    review.product = Product.create name:"candy",category:"sweets",quantity:3
    review.rating = nil
    review.valid?.must_equal false
  end
  it "rating must be between 1 and 5" do
    product = Product.create name:"candy",category:"sweets",quantity:3
    review.rating = 6
    review.valid?.must_equal false
  end

  it "must have a comment between 1 and 250 characters" do
    review.product = Product.create name:"candy",category:"sweets",quantity:3
    review.comment = ""
    review.valid?.must_equal false
  end

end
