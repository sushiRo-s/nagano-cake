class Manager::ProductsController < ApplicationController
  before_action:authenticate_admin!
  
  def index
    @products = Product.all
    @genres= Genre.all
  end
  
  def show
    @product = Product.find(params[:id])
    @genre = Genre.find(params[:id])
  end
  
  def new
   @newproduct = Product.new
   @genres= Genre.all
   
  end
  
  def create
    product = Product.new(product_params)
    product.save
    #@products = Product.all
    #@genres= Genre.all
    #render 'index'
    redirect_to  manager_product_path(product.id)
  end
  
  def edit
    @product = Product.find(params[:id])
    @genre = Genre.find(params[:id])
  end
  
  def update
    product = Product.find(params[:id])
    product.update(product_params)
    #@products = Product.find(params[:id])
    #@genre = Genre.find(params[:id])
    #render 'show'
    redirect_to manager_product_path(product.id)
  end
  
  private

  def product_params
    params.require(:product).permit(:name, :image, :title, :price, :genre_id, :is_active)
  end
  
end
