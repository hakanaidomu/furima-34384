class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :redirect, only: [:index, :create]

  def index
    @order_profile = OrderProfile.new
  end

  def create
    @order_profile = OrderProfile.new(order_params)
    if @order_profile.valid?
      pay_item
      @order_profile.save
      redirect_to root_path
    else
      render :index
    end
  end
end

private

def order_params
  params.require(:order_profile).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :tel).merge(
    token: params[:token], item_id: params[:item_id], user_id: current_user.id
  )
end

def set_item
  @item = Item.find(params[:item_id])
end

def redirect
  redirect_to root_path unless current_user.id != @item.user_id && @item.order.nil?
end

def pay_item
  Payjp.api_key = ENV['PAYJP_SECRET_KEY']
  Payjp::Charge.create(
    amount: @item.price,
    card: order_params[:token],
    currency: 'jpy'
  )
end
