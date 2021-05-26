class Public::ProductsController < ApplicationController

 before_action:authenticate_member!

  def index
   @products = Product.page(params[:page])

  end

  def show
   @cart = Cart.new
   @product = Product.find(params[:id])
  end

end
