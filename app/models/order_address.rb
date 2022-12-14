class OrderAddress
  include ActiveModel::Model

  attr_accessor :post_code, :city_code, :area_id, :post_number, :building_name, :phone_number, :user_id, :item_id, :token

  # ここにバリデーションの処理を書く
      #空の投稿を保存できないようにする
    validates :post_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "は半角数値の3桁(-)4桁で入力してください"}
    validates :city_code, presence: true
    validates :area_id, presence: true               
    validates :post_number, presence: true
    validates :phone_number, presence: true, format: {with: /\A\d{10}$|^\d{11}\z/,  message: "は半角数値の10桁から11桁以内に入力してください"}
    validates :user_id, presence: true
    validates :item_id, presence: true
    validates :token, presence: true

    #都道府県の選択が「---」の時は保存できないようにする
    validates :area_id, numericality: { other_than: 1 , message: "can't be blank"}



    # 各テーブルにデータを保存する処理を書く
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, city_code: city_code, area_id: area_id, post_number: post_number, building_name: building_name, phone_number:  phone_number, order_id: order.id)
  end
end


