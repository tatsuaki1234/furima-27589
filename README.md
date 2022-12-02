# テーブル設計

## users テーブル

| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| nickname           | string   | null: false               |
| email              | string   | null: false, unique: true | #ユニーク制約  unique: trueテーブル内に、同じ情報のレコードの保存を制限するための制約。
| password           | string   | null: false               |              emailアドレスを被らせないように実装したいときに使う
| name(kanji)        | string   | null: false               |
| name(kana)         | string   | null: false               |
| day_of_birth       | datetime | null: false               |

### Association

- has_many :items
- has_many :oders



## items テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| name       | string     | null: false                    |
| content    | text       | null: false                    |
| area_id    | integer    | null: false, foreign_key: true |
| price      | integer    | null: false                    |
| user_id    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :oder





## oders テーブル

| Column          | Type       | Options                        |
| ---------       | ---------- | ------------------------------ |
| user_id         | references | null: false, foreign_key: true |
| item_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_one    :address


## addresses テーブル

| Column          | Type       | Options                        |
| ---------       | ---------- | ------------------------------ |
| post_code       | string     | null: false                    |
| city_code       | string     | null: false                    |
| post_number     | string     | null: false                    |
| building_name   | string     |                                | #一軒家の場合、建物名はない。空でも登録できようにする。
| phone_number    | string     | null: false                    |
| oder_id         | references | null: false, foreign_key: true |


### Association

- belongs_to :oder












モデル
* どのようなデータを保存する必要があるか。
    * カラムの名称はどうすることが適切か
    * →tittle
    * →content
    * →name
    * カラムのデータ型はどう設定するのが適切か
    * →tittle(string)
    * →content(text)
    * →name(string)
* モデルの名称はどうするのが適切か
* →user
* →prototype
* →comment
コントローラー
* コントローラーの名称はどうするのが適切か
* →prototypes
* コントローラー内でどのアクションを実装すべきか
* →index
* →new
* →create
* →edit
* →update
* →show
* →destroy
ルーティング
* →questions
* →new
* →
* →
* →
* →