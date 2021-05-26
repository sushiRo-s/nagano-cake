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
    
    if  params[:order][:status] == "入金確認"
         order_products = order.order_products 
         order_products.each do |order_product|
          order_product.update(status: "製作待ち")
         end
         redirect_to manager_order_path(order)
    else
       redirect_to manager_order_path(order)
    end
  end
  
  private
  def order_params
    params.require(:order).permit(:last_name, :first_name,  :postcode, :address, :phone_number,  :status, :send_price, :total_price, :payment_method, :delivery_name, :delivery_postcode, :delivery_address)
  end
  
end
