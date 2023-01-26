class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @order_transact = OrderTransact.new
    if @item.order 
      redirect_to root_path
    end
  end

  def create
     @order_transact = OrderTransact.new(order_params)
    if @order_transact.valid?
      pay_item
      @order_transact.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_transact).permit(:postal_code, :area_id, :municipalities, 
      :adress, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end


end
