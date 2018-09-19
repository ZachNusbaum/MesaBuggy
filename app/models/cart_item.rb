class CartItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  def line_total
    product.price * qty
  end
end
