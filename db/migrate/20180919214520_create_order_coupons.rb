class CreateOrderCoupons < ActiveRecord::Migration[5.2]
  def change
    create_table :order_coupons do |t|
      t.references :order, foreign_key: true
      t.references :coupon, foreign_key: true

      t.timestamps
    end
  end
end
