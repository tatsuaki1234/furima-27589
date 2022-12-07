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


