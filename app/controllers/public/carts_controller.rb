class Public::CartsController < ApplicationController
 before_action:authenticate_member!

  def index
   @carts = current_member.carts
   @sum  = 0
   @carts.each do |cart|
    @sum += (cart.product.price * 1.1).floor * cart.quantity
   end
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
   @cart = Cart.find(params[:id])
   @cart.update(cart_params)
   redirect_to public_carts_path
  end

  def destroy
   cart = Cart.find(params[:id])
   cart.destroy
   redirect_to '/public/carts'
  end

  def destroy_all
   carts = Cart.all
   carts.destroy_all
   redirect_to '/public/carts'
  end

  private

  def cart_params
    params.require(:cart).permit(:quantity, :product_id)
  end


end

