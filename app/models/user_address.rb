class UserAddress < ApplicationRecord
  belongs_to :user
  belongs_to :address

  validates :address, uniqueness: true
end
