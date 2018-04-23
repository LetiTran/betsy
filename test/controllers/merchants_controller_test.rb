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

  it "should get new" do
  end

  it "should get create" do
  end

  it "should get edit" do
  end

  it "should get update" do
  end

  it "should get destroy" do
  end

end
