class OrderAddress
  include ActiveModel::Model

  # attr_accessor :hoge,:fuga...
  attr_accessor :post_code, :city_code, :area_id, :post_number, :building_name, :phone_number, :user_id, :item_id

  # ここにバリデーションの処理を書く
  # validates :title, presence: true
  # validates :split_tag_names, presence: true

  # with_options presence: true do
  #   validates :order_id
  #   validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  # end
  # validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}


  
    #空の投稿を保存できないようにする
    validates :post_code, presence: true
    validates :city_code, presence: true, format: { with: /\A[0-9]+\z/, message: 'は半角数字で入力して下さい。'}
    validates :area_id, presence: true               
    validates :post_number, presence: true, format: { with: /\A[0-9]+\z/, message: 'は半角数字で入力して下さい。'}
    validates :phone_number, presence: true

    #郵便番号は半角数字でハイフンであること
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}

    #都道府県の選択が「---」の時は保存できないようにする
    validates :area_id, numericality: { other_than: 1 , message: "can't be blank"}


    # 各テーブルにデータを保存する処理を書く
  def save
    # 寄付情報を保存し、変数donationに代入する
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Address.create(post_code: post_code,city_code: city_code, area_id: area.id, post_number: post_number, building_name: building_name, phone_number:  phone_number, user_id: user.id, item_id: item.id)
  end
end


# def save
#   return if invalid?

#   ActiveRecord::Base.transaction do
#     tags = split_tag_names.map { |name| Tag.find_or_create_by!(name: name) }
#     post.update!(title: title, content: content, tags: tags)
#   end
# rescue ActiveRecord::RecordInvalid
#   false
# end