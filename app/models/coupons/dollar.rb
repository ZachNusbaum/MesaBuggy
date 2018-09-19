class Coupons::Dollar < Coupon
  monetize :amount, as: 'value'
end