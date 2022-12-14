require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
    sleep(0.2)
    #"sleep(0.2)"を設定し読み込みタイミングを遅くずらしている。早すぎてactive_hashを読み込む前に処理が進みエラーになるから。
  end

  describe '商品新規登録' do
    context '商品新規登録できるとき' do
      it 'post_code、city_code、area_id、post_number、phone_number、building_name が存在すれば登録できる' do
        expect(@order_address).to be_valid
      end
      it 'building_nameが空でも、post_code、city_code、area_id、post_number、phone_number、が存在すれば登録できる' do
        @order_address.building_name = ""
        expect(@order_address).to be_valid
      end
    end

    context '商品登録できないとき' do
      it 'post_codeが空では登録できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank", "Post code は半角数値の3桁(-)4桁で入力してください")
      end
      it 'city_codeが空では登録できない' do
        @order_address.city_code = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City code can't be blank")
      end
      it 'area_idが[---]では登録できない' do
        @order_address.area_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Area can't be blank")
      end
      it 'post_numberが空では登録できない' do
        @order_address.post_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post number can't be blank")
      end
      it 'phone_numberが空では登録できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank", "Phone number は半角数値の10桁から11桁以内に入力してください")
      end
      it 'post_codeが3桁(-)4桁以外では登録できない' do
        @order_address.post_code = '1234-111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code は半角数値の3桁(-)4桁で入力してください")
      end
      it 'post_codeは(-)を含まないと登録できない' do
        @order_address.post_code = '1231234'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code は半角数値の3桁(-)4桁で入力してください")
      end
      it 'post_codeは半角数値でないと登録できない' do
        @order_address.post_code = '12３1234'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code は半角数値の3桁(-)4桁で入力してください")
      end
      it 'phone_numberは9桁以下では登録できない' do
        @order_address.phone_number = '012345678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number は半角数値の10桁から11桁以内に入力してください")
      end
      it 'phone_numberは12桁以上では登録できない' do
        @order_address.phone_number = '012345678901'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number は半角数値の10桁から11桁以内に入力してください")
      end
      it 'phone_numberに半角数字以外が含まれている場合は購入できない' do
        @order_address.post_code = '12３1234'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code は半角数値の3桁(-)4桁で入力してください")
      end
      it 'tokenが空では購入できないこと' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていなければ出品できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていなければ出品できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
