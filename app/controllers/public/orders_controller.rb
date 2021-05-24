class Public::OrdersController < ApplicationController
 before_action:authenticate_member!

  def new
   @order = Order.new
   @member = current_member
   @deliveries = @member.deliveries
  end

  def confirm
<<<<<<< HEAD
  @order = Order.new(order_params)
  @member = current_member
  @carts = current_member.carts
  @sum  = 0
  @carts.each do |cart|
  @sum += (cart.product.price * 1.1).floor * cart.quantity
  end
  @order.total_price = @sum + 800800
=======
     @order = Order.new(order_params)
     @member = current_member
     @carts = current_member.carts
     @sum  = 0
     @carts.each do |cart|
      @sum += (cart.product.price * 1.1).floor * cart.quantity
     end
     @order.total_price = @sum + @order.send_price
>>>>>>> origin/develop
  
   
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
    # @carts.each do |cart|
    #   @product = Product.find(params[:id])
    #   @order_product = Order_Products.new({
    #    purchase_price: (@product.price * 1.1).floor,
    #    quantity: cart.quantity,
    #    order_id: (@product.price * 1.1).floor * cart.quantity,
    #    product_id: @product.name
    #   })
    #  end
    #  @order_product.save
    @carts.destroy_all
   
    redirect_to public_complete_path
  end
   

  def complete
  end

  def index
   @orders = Order.page(params[:page]).reverse_order
   # @order_product = Order_product.find(params[:id])
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
    params.require(:order).permit(:payment_method, :status, :delivery_name, :delivery_address, :delivery_postcode, :member_id, :member_address, :total_price, :quantity, :product_name)
  end
  

end
