FactoryBot.define do
  factory :item do
    name                  {'test-item'}
    content               {'test-content'}
    image                 {Faker::Lorem.sentence}
    category_id           {'ハンドメイド'}
    condition_id          {'目立った傷や汚れなし'}
    postage_id            {'着払い(購入者負担)'}
    area_id               {'大阪府'}
    price                 {'600'}
  end
end
