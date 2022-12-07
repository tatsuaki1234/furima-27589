FactoryBot.define do
  factory :item do
    name                  {'test-item'}
    content               {'test-content'}
    image                 {'https://www.google.com/search?q=%E3%82%AA%E3%83%A0%E3%83%A9%E3%82%A4%E3%82%B9&rlz=1C5CHFA_enJP906JP908&sxsrf=ALiCzsbdhOL-YwaegZUfgeK4nPtv7c232g:1670395846728&source=lnms&tbm=isch&sa=X&ved=2ahUKEwjH_8-49eb7AhUmeN4KHXlvBk4Q_AUoAXoECAIQAw&biw=1440&bih=789&dpr=2#imgrc=0wT6xJSGCUK1BM'}
    category_id           {'ハンドメイド'}
    condition_id          {'目立った傷や汚れなし'}
    postage_id            {'着払い(購入者負担)'}
    area_id               {'大阪府'}
    price                 {'600'}
  end
end
