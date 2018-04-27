class OrdersController < ApplicationController
  before_action :find_order, only: [:show, :edit, :update]
  before_action :find_user

  def index
    # @orders = Order.all
    # TODO: maybe put a function that would change the status of the order for shipped if more than 3 days since created
    # @canceled_orders = Order.where(status:"canceled")
    # @processing_orders = Order.where(status:"processing")
    # @shipped_orders = Order.where(status:"paid")

    @orders = Order.where(merchant_id: @user.id).order(id: :desc)

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
    # If canceling an order:
    unless @order.status == "open"
      status = :success
      flash[:result_text] = "Order #{@order.id} was canceled." if @order.cancel_order
      redirect_to order_path(@order.id)

      # If competing an order by 'checking out':
    else   # _checkout_form comes here
      if @order.update(order_params)
        # @order.update(status: "paid")
        status = :success
        flash[:result_text] = "Checkout for order ##{@order.id} was successful."
        redirect_to orders_path
      else
        status = :bad_request
        flash[:result_text] = "Error: Cart could not be checked out. Please complete all fields."
        render :edit, status: status
      end
    end
  end

  def edit
  end

  private

  def order_params
    return params.require(:order).permit(:status, :email, :address, :card_name, :cc_number, :cc_expiration, :cvv, :zip_code)
  end

  def find_order
    @order = Order.find_by(id: params[:id])
    render_404 unless @order
  end




end
