class OrdersController < ApplicationController
before_action :set_item, only: [:index, :create]

  def index
    @order_profile = OrderProfile.new
  end

  def create
    @order = OrderProfile.new(order_params)
    if @order.valid?
      @order.sava
      redirect_to root_path
    else
      render :index
    end  

  end
end

private

def order_params
  params.require(:order_profile).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, 
    :tel, :item_id).merge(user_id: current_user.id)
end

def set_item
  @item = Item.find(params[:item_id])
end