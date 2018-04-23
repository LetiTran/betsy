class OrdersController < ApplicationController
  before_action :find_order, only: [:show, :edit, :update, :destroy]
  before_action :find_user
  
  def index
    @orders = Order.all
  end

  def show
  end

  def new
    @order = Order.new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
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
