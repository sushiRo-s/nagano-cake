class RemoveSendPriceFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :send_price, :integer
  end
end
