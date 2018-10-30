class ShoppingCartController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_order

  def show
  end

  def add_product
    if @order.cart_items.exists?(product_id: params[:id])
      @item = @order.cart_items.find_by(product_id: params[:id])
      @product = @item.product
      @item.qty += 1
      @item.save
    else
      @product = Product.find(params[:id])
      @order.products << @product
    end
    redirect_to cart_url, notice: "<b>#{@product.name}</b> added to cart!"
  end

  def apply_coupon
    return back_to_cart unless Coupon.exists?(code: coupon_params[:code])
    @coupon = Coupon.find_by_code(coupon_params[:code])
    return back_to_cart if @order.order_coupons.exists?(coupon_id: @coupon.id)
    @order.coupons << @coupon
    redirect_to cart_url, notice: 'Coupon applied!'
  end

  def update_qty
    @item = Product.find(params[:id])
    @cart_item = @order.cart_items.where(product_id: @item.id).first
    @cart_item.update(qty_params) if @cart_item
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

  def coupon_params
    params.require(:coupon).permit(:code)
  end

  def qty_params
    params.require(:cart_item).permit(:qty)
  end

  def back_to_cart
    redirect_to cart_url, alert: 'Error adding coupon'
  end
end
