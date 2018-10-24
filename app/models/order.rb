class Order < ApplicationRecord
  visitable

  has_many :cart_items
  has_many :products, through: :cart_items

  has_many :order_coupons
  has_many :coupons, through: :order_coupons

  def subtotal
    total_cents = 0
    self.cart_items.each do |item|
      total_cents += item.line_total.cents
    end
    return Money.new(total_cents)
  end

  def discount_total
    if self.coupons.any?
      @coupon = self.coupons.first
      if @coupon.type == "Coupons::Dollar"
        return @coupon.value
      elsif @coupon.type == "Coupons::Percent"
        return subtotal * @coupon.value
      else
        return Money.new(0)
      end
    else
      return Money.new(0)
    end
  end

  def total
    subtotal - discount_total
  end
end
