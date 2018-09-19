class Order < ApplicationRecord
  has_many :cart_items
  has_many :products, through: :cart_items
end
