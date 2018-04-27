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
  end

  describe "edit" do
    it "succeeds for an existing work ID" do
      get edit_merchant_path(Merchant.last.id)
      get edit_merchant_path(Merchant.first.id)

      must_respond_with :success
    end

    it "wont edit with bogus data" do
      get edit_merchant_path(" ")

      must_respond_with 404
    end
  end

  describe "update" do
    it "successfully updates a field with valid id" do
      updated_username = "table"
      updated_email = "table@table.com"

      patch merchant_path(Merchant.first.id), params: {
        merchant: {
          username: updated_username,
          email: updated_email
        }
      }

      updated_merchant = Merchant.find(Merchant.first.id)
      updated_merchant.username.must_equal updated_username
      updated_merchant.email.must_equal updated_email
    end

    # it "wont update bogus data" do
    #   updated_username = nil
    #
    #   patch merchant_path(merchants(:atul).id, params: {
    #     merchant: {
    #       username: updated_username,
    #     }
    #   }
    #
    #   must_respond_with :render
    # end

  end

  describe "destroy" do
    it "deletes a merchant" do
      delete merchant_path(Merchant.first.id)

      must_respond_with :redirect
    end

    it "must change merchant count" do
      initial = Merchant.count

      delete merchant_path(Merchant.first.id)

      Merchant.count.must_equal initial - 1
    end
  end


end
