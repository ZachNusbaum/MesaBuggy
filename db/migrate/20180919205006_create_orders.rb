class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :ip_address, null: true

      t.timestamps
    end
  end
end
