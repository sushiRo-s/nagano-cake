class Public::DeliveriesController < ApplicationController
  
  
  def index
    @delivery = Delivery.new
    @deliverys = Delivery.all
  end
  
  def create
  end
  
  def destroy
  end
  
  def edit
  end
  
  def update
  end
  
  
  
  
  
  
end
