class ShoppingCartController < ApplicationController
  def show
    create_order unless session[:order_id]
  end

  private

  def create_order
    @order = Order.create(ip_address: request.remote_ip)
    session[:order_id] = @order.id
  end

  def get_order
    @order = Order.find(session[:order_id])
  end
end
