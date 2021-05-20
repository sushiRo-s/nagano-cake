class Public::DeliveriesController < ApplicationController
 before_action:authenticate_member!

  def index
    @delivery = Delivery.new
    @deliverys = Delivery.all
  end

  def create
    delivery = Delivery.new(delivery_params)
    delivery.member_id = current_member.id
    delivery.save
    redirect_to action: :index
  end

  def destroy
    delivery = Delivery.find(params[:id])
    delivery.member_id = current_member.id
    delivery.destroy
    redirect_to action: :index
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end


  def update
    delivery = Delivery.find(params[:id])
    delivery.member_id = current_member.id
    delivery.update(delivery_params)
    redirect_to action: :index
  end



  private

  def delivery_params
    params.require(:delivery).permit(:postcode, :address, :name)
  end



end
