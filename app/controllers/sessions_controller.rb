class SessionsController < ApplicationController
  before_action :find_merchant, only: [:show, :index]
  before_action :find_user, only: [:show, :index]

  def index
    @total_revenue = 0
    @user.products.orders.each do |order|
      @total_revenue =+ order.total
    end

  end

  def show
    @merchant_orders = @user.products.orders

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
