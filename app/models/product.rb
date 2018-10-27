class Product < ApplicationRecord
  has_many :cart_items
  has_many :orders, through: :cart_items
  has_many :reviews
  belongs_to :category
  has_many_attached :images
  monetize :price_cents

  validates :name, presence: true
  validates :description, presence: true
  validates :price_cents, presence: true

  def average_rating
    reviews.average(:rating) || 0
  end
end
