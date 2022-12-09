class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions 
  # ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :area
  belongs_to :scheduled_delivery
  
    #空の投稿を保存できないようにする
  validates :image, presence: true
  validates :name, presence: true
  validates :content, presence: true
  validates :category_id, presence: true
  validates :postage_id, presence: true
  validates :area_id, presence: true
  validates :scheduled_delivery_id, presence: true
  validates :price, presence: true


    #ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :postage_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :area_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :scheduled_delivery_id, numericality: { other_than: 1 , message: "can't be blank"}

  validates_inclusion_of :price, in: (300..9999999), format: {with: /\A[0-9]+\z/ }
end




# class Article < ApplicationRecord
#   extend ActiveHash::Associations::ActiveRecordExtensions
#   belongs_to :category
#   belongs_to :condition
#   belongs_to :postage
#   belongs_to :area
#   belongs_to :send

#   #空の投稿を保存できないようにする
#   validates :name, presence: true
#   validates :content, presence: true
#   validates :category_id, presence: true
#   validates :postage_id, presence: true
#   validates :area_id, presence: true
#   validates :send_id, presence: true

#   #ジャンルの選択が「---」の時は保存できないようにする
#   validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
#   validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
#   validates :postage_id, numericality: { other_than: 1 , message: "can't be blank"}
#   validates :area_id, numericality: { other_than: 1 , message: "can't be blank"}
#   validates :send_id, numericality: { other_than: 1 , message: "can't be blank"}
# end



# with_options presence: true do
#   validates :name
#   validates :content
#   validates :image

# with_options  numericality: { other_than: 0 , message: "can't be blank"} do
#   validates :category_id
#   validates :condition_id
#   validates :postage_id
#   validates :area_id
#   validates :send_id
# end
# end