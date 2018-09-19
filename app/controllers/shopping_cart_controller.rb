class ShoppingCartController < ApplicationController
  before_action :set_order

  def show
  end

  def add_product
    if @order.cart_items.exists?(product_id: params[:id])
      @product = @order.products.find_by(product_id: params[:id])
      @order.products.qty += 1
    else
      @product = Product.find(params[:id])
      @order.products << @product
    end
    redirect_to cart_url
  end

  private

  def create_order
    @order = Order.create(ip_address: request.remote_ip)
    session[:order_id] = @order.id
  end

  def get_order
    @order = Order.find(session[:order_id])
  end

  def set_order
    if session[:order_id]
      get_order
    else
      create_order
    end
  end
end
