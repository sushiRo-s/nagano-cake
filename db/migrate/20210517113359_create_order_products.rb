class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      t.integer:order_id
      t.integer :product_id
      t.integer :status, default: 0
      t.integer :purchase_price
      t.integer :quantity
      t.timestamps
    end
  end
end
