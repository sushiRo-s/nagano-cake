class Manager::OrderProductsController < ApplicationController
  before_action:authenticate_admin!
  
  def update
     order_product = Order.find(params[:id])
     order_product.update(order_product_params)
     redirect_to manager_orders_path
  end
  
  private
  def order_product_params
    params.require(:order).permit(:last_name, :first_name,  :postcode, :address, :phone_number, :status, :send_price, :total_price, :payment_method, :delivery_name, :delivery_postcode, :delivery_address)
  end
  
end
