class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [ :index ]
  before_action :set_item, only: [ :index, :create]

  def index
    if @item.user_id != current_user.id
      @order_address = OrderAddress.new
    else
      redirect_to root_path
    end
    unless @item.order.present?
      @order_address = OrderAddress.new
    end
    if @item.order.present? && @item.user_id != current_user.id
      redirect_to root_path
    end
  end

  def create
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

  def set_item
    @item = Item.find(params[:item_id])
  end
end

