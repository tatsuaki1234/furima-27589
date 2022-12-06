class ItemsController < ApplicationController
 
  def index
  end

  def new(item_params)
  end


  private
  
  def item_params
    params.require(:item).permit(:nickname, :content, :category_id, :condition_id, :postage_id, :area_id, :send_id, :price, :image).merge(user_id: current_user.id)
  end
end
