class Coupon < ApplicationRecord
  has_many :order_coupons
  has_many :orders, through: :order_coupons
end
