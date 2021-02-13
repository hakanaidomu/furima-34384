class OrdersController < ApplicationController
before_action :set_item, only: [:index]
  def index
    @order_profile = OrderProfile.new
  end
end

def set_item
  @item = Item.find(params[:item_id])
end