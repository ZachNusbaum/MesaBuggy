class ShoppingCartController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_order, except: [:checkout_success]
  skip_before_action :verify_authenticity_token, only: [:process_checkout]

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

  def remove_coupon
    @order.order_coupons.first.try(:destroy)
    redirect_to cart_url
  end

  def update_qty
    @item = Product.find(params[:id])
    @cart_item = @order.cart_items.where(product_id: @item.id).first
    @cart_item.update(qty_params) if @cart_item
  end

  def remove_item
    @cart_item = @order.cart_items.where(product_id: params[:id]).first
    @cart_item.destroy
    redirect_to cart_url
  end

  def checkout
    if @order.cart_items.count === 0
      redirect_to cart_url, notice: 'Your cart has no items.'
    end
  end

  def process_checkout
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @order.total.cents,
      :description => "PetStore - Order #{@order.id}",
      :currency    => 'usd',
      :metadata    => {
        id: @order.id,
        subtotal: @order.subtotal,
        total: @order.total
      },
      :statement_descriptor => "PET STORE PURCHASE"
    )

    @order.update!(completed: true, payment_id: charge.id, charge: charge.to_h)
    reset_session
    redirect_to checkout_success_url(charge.id), notice: 'Order success'
    # session[:order_id] = nil


  rescue Stripe::CardError => e
    flash[:error] = e.message
    render :checkout
  end

  def checkout_success
    @order = Order.find_by(payment_id: params[:id])
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

  def order_params
    params.require(:order).permit!
  end
end
