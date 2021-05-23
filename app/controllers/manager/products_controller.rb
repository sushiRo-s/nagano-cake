class Manager::ProductsController < ApplicationController
  before_action:authenticate_admin!
  
  def index
    @products = Product.page(params[:page]).reverse_order
    @genres= Genre.all
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def new
   @newproduct = Product.new
   @genres= Genre.all
  end
  
  def create
    product = Product.new(product_params)
    product.save
    redirect_to  manager_product_path(product.id)
  end
  
  def edit
    @product = Product.find(params[:id])
  end
  
  def update
    product = Product.find(params[:id])
    product.update(product_params)
    redirect_to manager_product_path(product.id)
  end
  
  private

  def product_params
    params.require(:product).permit(:name, :image, :title, :price, :genre_id, :is_active)
  end
  
end
