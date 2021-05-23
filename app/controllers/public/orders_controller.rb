class Public::OrdersController < ApplicationController
 before_action:authenticate_member!

  def new
   @order = Order.new
   @member = current_member
   @deliveries = @member.deliveries
  end

  def confirm
  @order = Order.new  
  @carts = current_member.carts
  @member = current_member
  @deliveries = @member.deliveries
   
     if @order.delivery_address = "0"  
        @order.delivery_postcode = @member.postcode  
        @order.delivery_address =  @member.address  
        @order.delivery_name =    (@member.last_name + @member.first_name)
     elsif @order.delivery_address = "1"  
           @order.delivery_postcode = @deliveries.postcode  
           @order.delivery_address =  @deliveries.address 
           @order.delivery_name =     @deliveries.name
     elsif @order.delivery_address = "2"  
           order.save
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
    params.require(:order).permit(:payment_method, :status, :delivery_name, :delivery_address, :delivery_id, :delivery_postcode, :member_id, :member_address)
  end
  

end
