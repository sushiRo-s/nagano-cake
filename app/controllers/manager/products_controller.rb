class Manager::ProductsController < ApplicationController
  before_action:authenticate_admin!
  
  def index
    @products = Product.all
    @genres= Genre.all
  end
  
  def show
    @products = Product.find(params[:id])
    @genre = Genre.find(params[:id])
  end
  
  def new
   @newproduct = Product.new
   @genres= Genre.all
   
  end
  
  def create
    product = Product.new(product_params)
    product.save
    @products = Product.all
    @genres= Genre.all
    render 'index'
  end
  
  def edit
    @product = Product.find(params[:id])
    @genre = Genre.find(params[:id])
  end
  
  def update
    product = Product.find(params[:id])
    product.save
    @products = Product.find(params[:id])
    @genre = Genre.find(params[:id])
    render 'show'
  end
  
  private

  def product_params
    params.require(:product).permit(:name, :image, :title, :price)
  end
  
end
