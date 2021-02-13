class OrdersController < ApplicationController

  def index
    @order_profile = OrderProfile.new
  end
end
