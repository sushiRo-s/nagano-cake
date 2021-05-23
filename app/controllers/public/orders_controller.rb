class Public::OrdersController < ApplicationController
 before_action:authenticate_member!

  def new
   @order = Order.new
   @member = current_member
   @deliveries = @member.deliveries
  end

  def confirm
  @order = Order.new(order_params)
  @member = current_member
  @carts = current_member.carts
  @sum  = 0
  @carts.each do |cart|
  @sum += (cart.product.price * 1.1).floor * cart.quantity
  end
  @order.total_price = @sum + @order.send_price
  
   
     if params[:delivery_method] == "0"
        @order.delivery_postcode = @member.postcode  
        @order.delivery_address =  @member.address  
        @order.delivery_name =    (@member.last_name + @member.first_name)
        
     elsif params[:delivery_method]  == "1"  
           @delivery = Delivery.find(params[:order][:delivery_id])
           @order.delivery_postcode = @delivery.postcode  
           @order.delivery_address =  @delivery.address 
           @order.delivery_name =     @delivery.name
     elsif params[:delivery_method]  == "2"  
     else
           redirect_to new_public_order_path
     end

  end  

  def complete
  end

  def index
   @orders = Order.all
  end

  def show
   @order = Order.find(params[:id])
   @orders = Order.all
  end
  
  private

  def order_params
    params.require(:order).permit(:payment_method, :status, :delivery_name, :delivery_address, :delivery_postcode, :member_id, :member_address)
  end
  

end
