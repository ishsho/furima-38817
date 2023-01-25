class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_transact = OrderTransact.new
  end

  def create
     @item = Item.find(params[:item_id])
     @order_transact = OrderTransact.new(order_params)
    if @order_transact.valid?
      @order_transact.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_transact).permit(:postal_code, :area_id, :municipalities, 
      :adress, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id])
  end


end
