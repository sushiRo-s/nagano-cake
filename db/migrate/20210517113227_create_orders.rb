class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :member_id
      t.integer :send_price
      t.integer :status, default: 0
      t.integer :total_price
      t.integer :payment_method, default: 0
      t.string :delivery_name
      t.string :delivery_postcode
      t.string :delivery_address
      t.timestamps
    end
  end
end
