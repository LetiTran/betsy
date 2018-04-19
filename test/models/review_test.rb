require "test_helper"

describe Review do
  let(:review) { Review.new rating:1,comment:"hdjdjhjj", product_id: (Product.create name:"candy",category:"sweets",quantity:3).id }

  it "must be valid" do
    product = Product.create name:"candy",category:"sweets",quantity:3
    review.product.must_be :valid?
  end

  it "must be have a rating" do

    review.rating = nil
    review.valid?.must_equal false
  end

  it "rating must be between 1 and 5" do

    review.rating = 6
    review.valid?.must_equal false
  end

  it "must have a comment between 1 and 250 characters" do

    review.comment = ""
    review.valid?.must_equal false
  end

  it "belongs to a product and creates an error message if no product is given" do

    review = Review.new(rating: 1, comment:"qwewe")
    review.must_respond_to :product

    review.wont_be :valid?
    review.errors.messages.must_include :product
  end

end
