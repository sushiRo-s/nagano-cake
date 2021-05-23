class Public::CartsController < ApplicationController
 before_action:authenticate_member!

  def index
   @carts = current_member.carts
  end

  def create
   @cart = Cart.new(cart_params)
   @cart.member_id = current_member.id
   @update_cart_item = Cart.find_by(product_id: @cart.product_id)
   if @update_cart_item.present?
    @cart.quantity += @update_cart_item.quantity
    @update_cart_item.destroy
   end
   @cart.save
   redirect_to '/public/carts'
  end

  def update
   # @carts = Cart.find(params[:id])
   # @cart.update(cart_params)
   @cart.update(quantity: params[:quantity].to_i)
   redirect_to "index"
  end

  def destroy
   product = Product.find(params[:id])
   product.destroy
   redirect_to "index"
  end

  def destroy_all
  end

  private

  def cart_params
    params.require(:cart).permit(:quantity, :product_id)
  end


end

