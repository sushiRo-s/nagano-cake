class Public::ProductsController < ApplicationController

 before_action:authenticate_member!

  def index
   @products = Product.page(params[:page]).reverse_order
   
  end

  def show
   @cart = Cart.new
   @product = Product.find(params[:id])
  end

end
