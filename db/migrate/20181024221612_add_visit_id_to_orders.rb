class AddVisitIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :visit_id, :integer, null: true
  end
end
