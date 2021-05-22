class Public::CartsController < ApplicationController
 before_action:authenticate_member!

  def index
   @carts = current_member.carts
   # @products = cart.products
  end

  def create
   @cart_item = CartItem.new(cart_item_params)
   @cart_item.end_user_id = current_end_user.id
   # cart = current_member.cart
   # product = Product.find(params[:id])
   # cart.products.create!(product_id: product.id)
   # redirect_to new_public_order_path
  end

  def update
   @carts = Cart.find(params[:id])
   @cart.update(cart_params)
   redirect_to "index"
  end

  def destroy
   # cart = current_member.cart
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

