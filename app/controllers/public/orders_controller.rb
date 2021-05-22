class Public::OrdersController < ApplicationController
 before_action:authenticate_member!

  def new
   @order = Order.new
   @member = current_member
   @deliveries = Delivery.all
  end

  def confirm
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
    params.require(:order).permit(:payment_method, :status, :delivery_name, :delivery_address, :delivery_id, :delivery_postcode, :member_id, :member.address)
  end
  

end
