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

  def current_user
    @current_user ||= Merchant.find(session[:merchant_id]) if session[:merchant_id]
  end

  def current_order
   if !session[:order_id].nil?
     Order.find(session[:order_id])
   else
     Order.new
   end
 end
 
end
