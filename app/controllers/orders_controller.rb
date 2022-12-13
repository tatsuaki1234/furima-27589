class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      order_payment
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def order_params
    params.require(:order_address).permit(:post_code, :city_code, :area_id, :post_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def order_payment
    Payjp.api_key =  ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create( amount: @item.price, card: order_params[:token], currency: 'jpy' )
  end
end

# Payjp.api_key = sk_test_bfdb866e7228ca3b383cd97c
# Payjp.setPublicKey("pk_test_93f5dfe8ec7c9816fcc122d1");
