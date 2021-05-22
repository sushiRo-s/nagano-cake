class Manager::OrdersController < ApplicationController
  before_action:authenticate_admin!
  
   def index
    @orders = Order.page(params[:page]).reverse_order
   end
  
  def show
    @order = Order.find(params[:id])
  end
  def update
    order = Order.find(params[:id])
    order.update(order_params)
    redirect_to manager_orders_path
  end
  
  private
  def order_params
    params.require(:order).permit(:last_name, :first_name,  :postcode, :address, :phone_number,  :status, :send_price, :total_price, :payment_method, :delivery_name, :delivery_postcode, :delivery_address)
  end
  
end
