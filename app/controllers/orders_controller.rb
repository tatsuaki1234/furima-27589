class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    #params==>"token"=>"tok_3f1b757733f9bd892dae5ad8e833"あり。order_params==>"token_id"=>nil
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      Payjp.api_key = "sk_test_bfdb866e7228ca3b383cd97c"  
      # Payjp::Charge.create( amount: order_params[:@item.price], card: order_params[:token], currency: 'jpy' )
      Payjp::Charge.create( amount: @item.price, card: order_params[:token], currency: 'jpy' )
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def order_params
    params.require(:order_address).permit(:post_code, :city_code, :area_id, :post_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    # params.require(:order_address).permit(:post_code, :city_code, :area_id, :post_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
    # price token
  end
end




# sk_test_bfdb866e7228ca3b383cd97c      
# Payjp.api_key = "sk_test_bfdb866e7228ca3b383cd97c"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
# Payjp::Charge.create(
#   amount: order_params[:@item.price],  # 商品の値段
#   card: order_params[:token],    # カードトークン
#   currency: 'jpy'                 # 通貨の種類（日本円）
# )
