class Product < ApplicationRecord
  has_many :cart_items
  has_many :orders, through: :cart_items
  belongs_to :category
  has_many_attached :images
  monetize :price_cents
end
