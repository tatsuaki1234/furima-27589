class PurchaseImformationForm
  include ActiveModel::Model
  attr_accessor :hoge,:fuga...
  attr_accessor :title, :content, :tag_names

  # ここにバリデーションの処理を書く
  validates :title, presence: true
  validates :split_tag_names, presence: true

  def save
    # 各テーブルにデータを保存する処理を書く
    params.require(:item).permit(:name, :image, :content, :category_id, :condition_id, :postage_id, :area_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end
end


def save
  return if invalid?

  ActiveRecord::Base.transaction do
    tags = split_tag_names.map { |name| Tag.find_or_create_by!(name: name) }
    post.update!(title: title, content: content, tags: tags)
  end
rescue ActiveRecord::RecordInvalid
  false
end