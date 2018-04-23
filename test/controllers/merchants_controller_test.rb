require "test_helper"

describe MerchantsController do
  it "should get index" do
    get merchants_path

    must_respond_with :success
  end

  it "should get show" do
    get merchant_path(merchants(:one).id)

    must_respond_with :success
  end

  # it "should get create" do
  #   initial = Merchant.count
  #   post merchants_path
  #
  #   Merchant.count.must_equal initial + 1
  #   must_respond_with :redirect
  #   must_redirect_to merchants_path
  # end

  # it "should get edit" do
  # end
  #
  # it "should get update" do
  # end
  #
  # it "should get destroy" do
  # end

end
