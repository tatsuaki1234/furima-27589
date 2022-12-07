class ItemsController < ApplicationController
 
  def index
  end

  def new
    # @items = Item.order("created_at DESC")
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  private
  
  def item_params
    params.require(:item).permit(:name, :content, :category_id, :condition_id, :postage_id, :area_id, :send_id, :price, :image).merge(user_id: current_user.id)
  end
end


