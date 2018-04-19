require "test_helper"

describe Order do
  let(:order) { Order.new address: "123, Fake address", card_name: "A name", cc_number: "1234567891234567", cc_expiration: Date.new(2001,2) , cvv: "123", zip_code: "98005", email: "email@test.com"  }

  it "must be valid" do
    value(order).must_be :valid?
  end

it 'must have a address' do
  order.address = nil
  order.valid? 
end

end
