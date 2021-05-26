class Manager::OrderProductsController < ApplicationController
  before_action:authenticate_admin!
  
  def update
     order_product = OrderProduct.find(params[:id])
     order_product.update(order_product_params)
     @order = order_product.order
     
     if params[:order_product][:status] == "製作中"
        @order.update(status: "製作中")
        redirect_to manager_order_path(@order.id)
       
     elsif params[:order_product][:status] == "製作完了" 
      # if  @order.order_products.all? do |op| op.status == "製作完了"  end
       if  @order.order_products.count == @order.order_products.where(status: "製作完了").count
            @order.update(status: "発送準備中")
       end
       redirect_to manager_order_path(@order.id)
     else
       redirect_to manager_order_path(@order.id)
     end
     
  end
  
  private
  def order_product_params
    params.require(:order_product).permit(:last_name, :first_name,  :postcode, :address, :phone_number, :status, :send_price, :total_price, :payment_method, :delivery_name, :delivery_postcode, :delivery_address)
  end
  
end
