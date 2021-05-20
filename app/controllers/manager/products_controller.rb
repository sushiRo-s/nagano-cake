class Manager::ProductsController < ApplicationController
  before_action:authenticate_admin!
  
  def index
    @products = Product.all
    @genres= Genre.all
  end
  
  def show
  end
  
  def new
   @product = Product.new
   @genres= Genre.all
  end
  
  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to manager_products_path
  end
  
  def edit
  end
  
  def update
  end
  
  private

  def product_params
    params.require(:product).permit(:name, :image, :title)
  end
  
end
