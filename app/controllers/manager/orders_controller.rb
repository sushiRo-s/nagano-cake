class Manager::OrdersController < ApplicationController
  before_action:authenticate_admin!
  
   def index
    @orders = Order.page(params[:page]).reverse_order
   end
  
  def show
    @order = Order.find(params[:id])
    @orders = Order.all
    @member = Member.find(@order.member.id)
    @sum = 0
    @order.order_products.each do |order_product|
     @sum += (order_product.purchase_price).floor * order_product.quantity
    end
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
