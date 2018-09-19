class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.references :category, foreign_key: true
      t.text :description, null: true
      t.integer :price_cents, default: 0
      t.integer :quantity, default: 0
      t.decimal :weight, default: 0
      t.boolean :published, default: true

      t.timestamps
    end
  end
end
