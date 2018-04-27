require "test_helper"

describe MerchantsController do
  it "should get index" do
    get merchants_path

    must_respond_with :success
  end

  it "should get show" do
    get merchant_path(merchants(:atul).id)

    must_respond_with :success
  end

  describe "new" do
    it "succeeds" do
      get new_merchant_path

      must_respond_with :success
    end
  end

  describe "create" do
    it "creates a valid merchant" do
      proc {
        post merchants_path, params: {
          merchant: {
            username: "hello",
            email: "h@h.com"
          }
        }
      }.must_change "Merchant.count", 1

      must_respond_with :redirect
      must_redirect_to merchants_path
    end

    it "does not add bad merchant to db" do
      post works_path, params: {
      merchant: {
        username: merchants(:atul).username,
        email: "yolo@yolo.com"
      }
    }

    must_respond_with :bad_request
  end

    end
  end

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
