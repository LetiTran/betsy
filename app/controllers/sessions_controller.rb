class SessionsController < ApplicationController
  before_action :find_merchant, only: [:show, :index]
  before_action :find_user

  def index

    @sold_products =[]
    # @user_orders = Order.where()@user.products.orders
    paid_ordes= Order.where(status: "paid")
    paid_ordes.each do |po|
      po.orderproducts.each do |op|
        product = Product.find_by(id: op.product_id)
        if product.merchant_id == @user.id
          @sold_products << product
        end
      end
    end

    @total_revenue = 0
    @sold_products.each do |p|
      @total_revenue =+ p.price
    end

  end

  def show
    @user_products = @user.products

  end

  def new
    @merchant = Merchant.new
  end

  def create
    auth_hash = request.env['omniauth.auth']

    if auth_hash[:uid]
      @merchant = Merchant.find_by(uid: auth_hash[:uid], provider: 'github')
      if @merchant.nil?
        # it's a new merchant, we need to make a merchant
        @merchant = Merchant.build_from_github(auth_hash)
        successful_save = @merchant.save
        if successful_save
          flash[:success] = "Logged in successfully"
          session[:merchant_id] = @merchant.id
          redirect_to homepage_path
        else
          flash[:error] = "Some error happened in Merchant creation"
          redirect_to homepage_path
        end
      else
        flash[:success] = "Logged in successfully"
        session[:merchant_id] = @merchant.id
        redirect_to homepage_path
      end

    else
      flash[:error] = "Logging in via github not successful"
      redirect_to homepage_path
    end
  end

  def destroy
    session[:merchant_id] = nil
    flash[:success] = "You logged out!"
    redirect_to homepage_path
  end

  private
  def find_merchant
    @merchant = Merchant.find_by(id: params[:id])
    render_404 unless @merchant
  end
end
