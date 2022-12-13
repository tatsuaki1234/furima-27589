FactoryBot.define do
  factory :order_address do

    post_code        {'123-1234'}
    city_code        {'大阪市'}
    area_id          {'1'}
    post_number      {'2-33-6'}
    phone_number     {'09084763526'}
    building_name    {'おおきにマンション'}
    token            {"tok_abcdefghijk00000000000000000"}
    association :user
    association :item
    
  end
end


