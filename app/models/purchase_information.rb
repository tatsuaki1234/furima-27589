class PurchaseImformationForm
  include ActiveModel::Model
  attr_accessor :hoge,:fuga...

  # ここにバリデーションの処理を書く

  def save
    # 各テーブルにデータを保存する処理を書く
    params.require(:item).permit(:name, :image, :content, :category_id, :condition_id, :postage_id, :area_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end
end