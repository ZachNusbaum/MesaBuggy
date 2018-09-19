class Coupons::Percent < Coupon
  def value
    amount.to_d / 100
  end
end