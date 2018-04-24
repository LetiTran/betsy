class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def render_404
    # raise ActionController::RoutingError.new('Not Found')
    render text: 'Not Found', status: '404'
  end

  private

  def find_user
    @user = Merchant.find_by(id: session[:merchant_id])
  end

  def find_order
    @order = Order.find_by({merchant_id: @user.id, status: "open"})
  end

end
