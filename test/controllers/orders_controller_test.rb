
require "test_helper"

describe OrdersController do
 describe 'index' do
   describe 'index' do
     it 'should get all products' do
       get orders_path
       must_respond_with :success
     end

     it 'should work with no products' do
       Order.destroy_all
       assert Order.all.empty?
       get orders_path
       must_respond_with :success
     end
   end
 end

  describe 'create' do
    it 'creates a product with valid id' do
      existing_merchant = merchants(:one)
      perform_login(existing_merchant)
      proc {
        post orders_path, params: {
          order: {
            email: "test@test.com",
            address: "A address",
            card_name: "A card name",
            cc_number: "1234567890123456",
            cc_expiration: "03-02-2019",
            cvv: "123",
            zip_code: "98000",
            status: :paid
            # merchant_id: existing_merchant.id
          }
        }
      }.must_change 'Order.count', 1

      # Assert
      must_respond_with :redirect
      must_redirect_to order_path(Order.last.id)
    end

    it 'creates a product with valid id' do
      existing_merchant = merchants(:one)
      perform_login(existing_merchant)
      proc {
        post orders_path, params: {
          order: {
            status: :open
            # merchant_id: existing_merchant.id
          }
        }
      }.must_change 'Order.count', 1

      # Assert
      must_respond_with :redirect
      must_redirect_to order_path(Order.last.id)
    end

  end


end
