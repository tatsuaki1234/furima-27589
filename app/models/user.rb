class User < ApplicationRecord

  has_many :items
  # has_many :orders
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :encrypted_password, presence: true, length: { mimimum: 6 }
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze, message: 'は英字と数字の組み合わせで入力して下さい。' }
  validates :nickname, presence: true
  validates :family_name_kanji, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は漢字かひらがなかカタカナで入力して下さい。' }
  validates :first_name_kanji, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は漢字かひらがなかカタカナで入力して下さい。' }
  validates :family_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :day_of_birth, presence: true
end



# /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
# /\A[ぁ-んァ-ン一-龥]/


# 全角カタカナ
# /\A[ァ-ヶー－]+\z/

# 漢字
# /\A[一-龥]+\z/

# format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'

# email has aleady been taken
# email need @ mark
# password doesnt mach
# passwordは6文字以上であること
# はすでにdeviseで初期設定されている

