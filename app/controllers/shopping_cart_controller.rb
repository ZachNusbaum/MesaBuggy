class ShoppingCartController < ApplicationController
  before_action :set_order

  def show
  end

  def add_product
    if @order.cart_items.exists?(product_id: params[:id])
      @item = @order.cart_items.find_by(product_id: params[:id])
      @item.qty += 1
      @item.save
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
