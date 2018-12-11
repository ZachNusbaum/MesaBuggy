class AddChargeObjectToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :charge, :jsonb
  end
end
