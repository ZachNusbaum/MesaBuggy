class CreateCoupons < ActiveRecord::Migration[5.2]
  def change
    create_table :coupons do |t|
      t.string :type
      t.integer :amount, default: 0, null: false
      t.datetime :starts_at, null: true, default: nil
      t.datetime :ends_at, null: true, default: nil
      t.string :code, null: false
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
