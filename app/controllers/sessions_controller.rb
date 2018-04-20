class SessionsController < ApplicationController
  def index
  end

  def show
  end

  def create
    @merchant = Merchant.find_by(username: params[:merchant][:username])

    if @merchant
      session[:merchant_id] = @merchant.id

      flash[:success] = "Welcome back #{@merchant.username}"
      redirect_to root_path
    else
      @merchant = Merchant.create(username: params[:merchant][:username])
      if session[:merchant_id] = @merchant.id
        flash[:success] = "Successfully logged in as #{@merchant.username}"
        redirect_to root_path
      else
        flash.now[:error] = "You are not logged in. Please login"
        render :new
      end
    end
  end

  def new
    @merchant = Merchant.new
  end

  def destroy
    session[:merchant_id] = nil
    flash[:success] = "You logged out!"
    redirect_to root_path
  end
end
