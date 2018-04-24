class OrderproductsController < ApplicationController
  before_action :find_orderproduct, only: [:edit, :update, :destroy]
  before_action :find_user

  def index
    @orderproducts = Orderproduct.all
  end

  def show
  end

  def new
    # one:
    #   status: Paid
    #   email: some_person@testing.com
    #   address: 123 Fake addres, Faketown
    #   card_name: Fake Buyer
    #   cc_number: 1234123412341234
    #   cc_expiration: 2018-04-19
    #   cvv: 1234
    #   zip_code: 98010
    @product = Product.find_by(id: params[:product_id])
    @orderproduct = Orderproduct.new
    #
  end

  def create
    @product = Product.find_by(id: params[:orderproduct][:product_id])

    @orderproduct = Orderproduct.new(orderproduct_params)
    @orderproduct.merchant_id = @user.id
    if @orderproduct.save
      redirect_to orderproducts_path
    end


    # @order = current_order
    # @orderproduct = @order.orderproduct.new(orderproduct_params)
    # @order.save
    #
    # session[:order_id] = @order.id


    # @product = Product.find_by(id: params[:product_id])
    # @orderproduct = OrderProduct.new(orderproduct_params)
    # @orderproduct.product_id = @product.id
    # #@orderproduct.order_id = @order.id
    # if @orderproduct.save
    #   status = :success
    #   flash[:result_text] = "#{@orderproduct.quantity} #{@orderproduct.product.name} have been added to your order!"
    #   redirect_to products_path
    # else
    #   status = :bad_request
    #   flash[:result_text] = "Error - products not added to your order"
    #   render :new, status: status
    # end
  end

  def edit
  end

  def update
    if @orderproduct.update(orderproduct_params)
      flash[:status] = :success
      flash[:result_text] = "Cart updated"
      redirect_to orders_path
    else
      flash.now[:status] = :failure
      flash.now[:result_text] = "Cart could not be updated"
      flash.now[:messages] = @orderproduct.errors.messages
      render :edit
    end
  end

  def destroy
    order = @orderproduct.order
    @orderproduct.destroy
    if order.orderproducts.empty?
      order.destroy
    end
    flash[:status] = :success
    flash[:result_text] = "Successfully removed from your cart!"
    redirect_to orders_path
  end

  private

  def orderproduct_params
    params.require(:orderproduct).permit(:quantity, :product_id)
  end

  def find_orderproduct
    @orderproduct = Orderproduct.find_by(id: params[:id])
    render_404 unless @orderproduct
  end
end
