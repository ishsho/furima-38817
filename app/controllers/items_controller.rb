class ItemsController < ApplicationController

  def index
    @items = Item.all
  end
  
  def new
    @items = Item.new
  end

  def create
    Item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :content, 
      :category_id, :state_id, :load_id, :area_id, :shipping_date_id,:price).merge(
      user_id: current_user.id)

end
