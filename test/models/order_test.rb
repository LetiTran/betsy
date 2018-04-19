require "test_helper"

describe Order do
  let(:order) { Order.new address: "123, Fake address", card_name: "A name", cc_number: "1234567891234567", cc_expiration: Date.new(2001,2) , cvv: "123", zip_code: "98005", email: "email@test.com"  }

  describe 'validations' do


    it "must be valid" do
      value(order).must_be :valid?
    end


    it 'must have a address' do
      order.address = nil
      order.valid?.must_equal false
    end

    it 'must have an address with length more than 0 characters' do
      order.address = ""
      order.valid?.must_equal false
    end

    it 'must cannot have an address with length more than 35' do
      order.address = "123451234512345123451234512345123451"
      order.valid?.must_equal false
    end

    it 'must have a card name' do
      order.card_name = nil
      order.valid?.must_equal false
    end

    it 'must have a card name with more than 0 characters' do
      order.card_name = ""
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

    it 'card expiration must be a date' do
      order.cc_expiration = "a string"
      order.valid?.must_equal false
    end
  end

  describe "relations" do
    it "has a list of products" do
      # candy = products(:candy)
      order.must_respond_to :products
      order.products.each do |product|
        product.must_be_kind_of Product
      end
    end

  end
end
