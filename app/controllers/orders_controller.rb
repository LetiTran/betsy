class OrdersController < ApplicationController
  before_action :find_order, only: [:show, :edit, :update, :destroy]
  before_action :find_user

  def index
    # @orders = Order.all
    @orders = Order.where(merchant_id: @user.id)
  end

  def show
  end

  def new
    @order = Order.new()

  end

  def create
    @order = Order.new(order_params)
    @order.update(status: "open")
    if @order.save
      redirect_to order_path(@order.id)
    else
      flash[:failure] = :failure
      flash.now[:result_text]= "Error: Order was not created"
      render :new
    end
  end

  def update
    # Checkout form comes here
    if @order.update(order_params)
      @order.update(status: "paid")
      reduce_inventory(order)
      redirect_to orders_path
      flash[:message] = "Checkout successful"
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
    if @order
      @order.destroy
        @order.update(status: "cancelled")
        add_inventory(order)
      flash[:message] = "Deleted #{@order}"
      redirect_to orders_path
    else
      flash[:failure] = :failure
      flash.now[:result_text]= "Error: Order was not created"
      redirect_to order_path(@order.id)
    end
  end

  private

  def order_params
    return params.require(:order).permit( :email, :address, :card_name, :cc_number, :cc_expiration, :cvv, :zip_code)
  end

  def find_order
    @order = Order.find_by(id: params[:id])
    render_404 unless @order
  end

  def reduce_inventory(order)
    order.orderproducts.each do |orderproduct|
      product = Product.find_by(id: orderproduct.product_id)
      product.quantity -= orderproduct.quantity
      product.save
    end
  end

  def add_inventory(order)
    order.orderproducts.each do |orderproduct|
      product = Product.find_by(id: orderproduct.product_id)
      product.quantity += orderproduct.quantity
      product.save
    end
  end
end
