class OrdersController < ApplicationController
  def index
    #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
    # @order = Order.all
    # @item = Item.find(params[:id])
    # @donation_address = DonationAddress.new
    #  @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
    # @user = User.find(params[:id])
    @order_address = OrderAddress.new
  end

  def create
    # binding.pryは処理に不要なので削除する
    # 値をDBへ保存する実装
    # @order = Order.new(order_params)
    # @order_address = OrderAddress.new(order_params)
    # @donation = Donation.create(donation_params)
    # Address.create(address_params)
    # redirect_to root_path


    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def order_params
    # params.permit(:post_code, :city_code, :area_id, :post_number, :building_name, :phone_number).merge(order_id: @order.id)
    # params.require(:item).permit(:name, :image, :content, :category_id, :condition_id, :postage_id, :area_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
    # params.permit(:post_code, :city_code, :area_id, :post_number, :building_name, :phone_number).merge(order_id)
    # params.require(:order_address).permit(:post_code, :city_code, :area_id, :post_number, :building_name, :phone_number).merge(order_id: @order.id)
    params.require(:order_address).permit(:post_code, :city_code, :area_id, :post_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
    # price token
  end
  # def donation_params
  #   params.permit(:price).merge(user_id: current_user.id)
  # end

  # def address_params
  #   params.permit(:postal_code, :prefecture, :city, :house_number, :building_name).merge(donation_id: @donation.id)
  # end

end

# def donation_params
#   params.require(:donation_address).permit(:postal_code, :prefecture, :city, :house_number, :building_name, :price).merge(user_id: current_user.id)