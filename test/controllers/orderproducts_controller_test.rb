require "test_helper"

describe OrderproductsController do
  it "should get index" do
    get orderproducts_index_url
    value(response).must_be :success?
  end

  it "should get show" do
    get orderproducts_show_url
    value(response).must_be :success?
  end

  it "should get create" do
    get orderproducts_create_url
    value(response).must_be :success?
  end

  it "should get new" do
    get orderproducts_new_url
    value(response).must_be :success?
  end

  it "should get edit" do
    get orderproducts_edit_url
    value(response).must_be :success?
  end

  it "should get update" do
    get orderproducts_update_url
    value(response).must_be :success?
  end

  it "should get destroy" do
    get orderproducts_destroy_url
    value(response).must_be :success?
  end


  # 
  # it "must increase orderproduct count" do
  #   before = Orderproduct.all.count
  #
  #   newop = Orderproduct.create_orderproduct(products(:candy).quantity, products(:candy).id, orders(:open).id)
  #   newop.save
  #
  #   Orderproduct.all.count.must_equal before +1
  # end

end
