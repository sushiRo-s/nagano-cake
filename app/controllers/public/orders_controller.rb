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
     @order.total_price = @sum + 800
  
   
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
  
  def create
   @order = Order.new(order_params)
   @order.member_id = current_member.id
   @order.save
   
   @carts = current_member.carts
       @carts.each do |cart|
        @orderproduct = OrderProduct.new({
         purchase_price: (cart.product.price * 1.1).floor,
         quantity: cart.quantity,
         order_id: (cart.product.price * 1.1).floor * cart.quantity,
         product_id: cart.product_id
        })
        @orderproduct.order_id = @order.id
        @orderproduct.save
       end
    @carts.destroy_all
   
    redirect_to public_complete_path
  end
   
  def complete
  end

  def index
   @orders = Order.page(params[:page]).reverse_order
   #@orderproduct = OrderProduct.where(order_id: order.id)
  end

  def show
   @order = Order.find(params[:id])
   @orders = Order.all
   @carts = current_member.carts
   @sum  = 0
   @carts.each do |cart|
   @sum += (cart.product.price * 1.1).floor * cart.quantity
   end
  end
  
  private

  def order_params
    params.require(:order).permit(:payment_method, :delivery_name, :delivery_address, :delivery_postcode, :total_price)
  end
  

end
