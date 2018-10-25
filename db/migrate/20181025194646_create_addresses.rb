class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :user, foreign_key: true
      t.string :street1, null: false
      t.string :street2
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip_code, null: false
      t.decimal :latitude
      t.decimal :longitude
      t.string :nickname
      t.string :token

      t.timestamps
    end
    add_index :addresses, :token, unique: true
  end
end
