require "test_helper"

describe Order do
  let(:order) { Order.new address: "123, Fake address", card_name: "A name", cc_number: "1234567891234567", cc_expiration: Date.new(2001,2) , cvv: "123", zip_code: "98005", email: "email@test.com"  }

  it "must be valid" do
    value(order).must_be :valid?
  end

  it 'must have a address' do
    order.address = nil
    order.valid?.must_equal false
  end

  it 'must have a address with length more' do
    order.address = nil
    order.valid?.must_equal false
  end

  it 'must have a card name' do
    order.card_name = nil
    order.valid?.must_equal false
  end

  it 'must have a card number' do
    order.cc_number = nil
    order.valid?.must_equal false
  end

  it 'must have a card expiration' do
    order.cc_expiration = nil
    order.valid?.must_equal false
  end

  it 'must have a cvv' do
    order.cvv = nil
    order.valid?.must_equal false
  end
  it "must have a length of three characters" do
    order.cvv = "cvvv"
    order.valid?.must_equal false
  end

  it 'must have a zipcode' do
    order.zip_code = nil
    order.valid?.must_equal false
  end

  it "zipcode length must be 5 " do
    order.zip_code = "980756"
    order.valid?.must_equal false
  end

  it 'must have a email' do
    order.email = nil
    order.valid?.must_equal false
  end

  it "must have a valid email format" do
    order.email = "12345@.email.com"
    order.valid?.must_equal false
  end

  it "must have a unique email id" do
    exisiting_email = Order.first.email
    order.email = "some_person@testing.com"
    order.valid?.must_equal false
  end
  




end
