class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @oeder = Order.new
  end

  def create
    Order.create(order_params)
  end

  private

  def order_params
    parems.require(:order).permit(:item, :user).merge(user_id: current_user.id, item_id: prams[:item_id])
  end


end
