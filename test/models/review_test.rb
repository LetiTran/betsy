require "test_helper"

describe Review do
  let(:review) { Review.new rating: 2, comment: nil }

  it "must be valid" do
    review.must_be :valid?
  end
end
