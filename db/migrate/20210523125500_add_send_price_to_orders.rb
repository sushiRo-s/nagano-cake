class AddSendPriceToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :send_price, :integer, default: 800
  end
end
