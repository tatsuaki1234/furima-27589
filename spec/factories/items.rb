FactoryBot.define do
  factory :item do
    name                  {'test-item'}
    content               {'test-content'}
    category_id           {'2'}
    condition_id          {'2'}
    postage_id            {'2'}
    area_id               {'2'}
    scheduled_delivery_id {'2'}
    price                 {'600'}

    association :user
    # association :oder

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
