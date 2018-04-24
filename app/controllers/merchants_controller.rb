class MerchantsController < ApplicationController
  before_action :find_merchant, only: [:show, :edit, :update, :destroy]
  before_action :find_user

  def index
    @merchants = Merchant.all
  end

  def show
  end

  private

  def merchant_params
    return params.require(:merchant).permit(:username, :email)
  end

  def find_merchant
    @merchant = Merchant.find_by(id: params[:id])
    render_404 unless @merchant
  end
end
