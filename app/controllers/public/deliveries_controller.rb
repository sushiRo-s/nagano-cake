class Public::DeliveriesController < ApplicationController


  def index
    @delivery = Delivery.new
    @deliverys = Delivery.all
  end

  def create
    delivery = Delivery.new(delivery_params)
    delivery.save
    redirect_to 'index'
  end

  def destroy
    
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end


  def update
    delivery = Delivery.find(params[:id])
    delivery.update(delivery_params)
    redirect_to 'index'
  end
  
  
  
  
  
  private

  def delivery_params
    params.require(:delivery).permit(:postcode, :address, :name)
  end



end
