class Coupons::Percent < Coupon
  def value
    amount / 100
  end
end