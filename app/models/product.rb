class Product < ApplicationRecord
  has_many :cart_items
  has_many :orders, through: :cart_items
  belongs_to :category
  monetize :price_cents
end
