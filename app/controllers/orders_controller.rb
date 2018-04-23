class OrdersController < ApplicationController
  before_action :find_order, only: [:show, :edit, :update, :destroy]
  before_action :find_user

  def index
    @orders = Order.all
  end

  def show
  end

  def new
    @order = Order.new()

  end

  def create
    @order = Order.new(order_params)

    binding.pry
    if @order.save
      flash[:status] = :success
      redirect_to order_path(@order.id)
    else
      flash[:failure] = :failure
      flash.now[:result_text]= "Error: Order was not created"
      render :new
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def order_params
    return params.require(:order).permit( :email, :address, :card_name, :cc_number, :cc_expiration, :cvv, :zip_code)
  end

  def find_order
    @order = Order.find_by(id: params[:id])
    render_404 unless @order
  end
end
