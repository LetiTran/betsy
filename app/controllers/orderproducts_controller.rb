class OrderproductsController < ApplicationController
  before_action :find_orderproduct, only: [:edit, :update, :destroy]

  def index
    @orderproducts = Orderproduct.all
  end

  def show
  end

  def create

    if @order.nil?
      @order = Order.create(status: "pending")
    end
    @op = @order.orderproducts.find_by(product_id: params[:id])
    if @op
      @op.quantity += params[:orderproduct][:quantity].to_i
    else
      @op = Orderproduct.new(orderproduct_params)
      @op.product_id = params[:id]
    end
    if @op.save
      flash[:status] = :success
      flash[:result_text] = "Successfully added to cart"
      redirect_to product_path(params[:id])
    else
      flash[:status] = :failure
      flash[:result_text] = "Sorry"
      flash[:messages] = @op.errors.messages
      redirect_to product_path(params[:id]), status: :bad_request
    end
  end

  def new
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
    params.require(:order_product).permit(:quantity)
  end
  def find_orderproduct
    @order_product = Orderproduct.find_by(params[:id])
  end
end
