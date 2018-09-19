class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.references :order, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :qty, null: false, default: 1

      t.timestamps
    end
  end
end
