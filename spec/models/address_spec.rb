require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:order_address)
  end

  describe '商品新規登録' do
    context '商品新規登録できるとき' do
      it 'post_code、city_code、area_id、post_number、phone_number、building_name が存在すれば登録できる' do
        expect(@address).to be_valid
      end
      it 'building_nameが空でも、post_code、city_code、area_id、post_number、phone_number、が存在すれば登録できる' do
        @address.building_name = ""
        expect(@address).to be_valid
      end
    end

    context '商品登録できないとき' do
      it 'post_codeが空では登録できない' do
        @address.post_code = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Post code can't be blank", "Post code は半角数値の3桁(-)4桁で入力してください")
      end
      it 'city_codeが空では登録できない' do
        @address.city_code = ""
        @address.valid?
        expect(@address.errors.full_messages).to include("City code can't be blank")
      end
      it 'area_idが[---]では登録できない' do
        @address.area_id = '0'
        @address.valid?
        expect(@address.errors.full_messages).to include("Area can't be blank")
      end
      it 'post_numberが空では登録できない' do
        @address.post_number = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Post number can't be blank")
      end
      it 'phone_numberが空では登録できない' do
        @address.phone_number = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number can't be blank", "Phone number は半角数値の10桁から11桁以内に入力してください")
      end
      it 'post_codeが3桁(-)4桁以外では登録できない' do
        @address.post_code = '1234-111'
        @address.valid?
        expect(@address.errors.full_messages).to include("Post code は半角数値の3桁(-)4桁で入力してください")
      end
      it 'post_codeは(-)を含まないと登録できない' do
        @address.post_code = '1231234'
        @address.valid?
        expect(@address.errors.full_messages).to include("Post code は半角数値の3桁(-)4桁で入力してください")
      end
      it 'post_codeは半角数値でないと登録できない' do
        @address.post_code = '12３1234'
        @address.valid?
        expect(@address.errors.full_messages).to include("Post code は半角数値の3桁(-)4桁で入力してください")
      end
      it 'phone_numberは9桁以下では登録できない' do
        @address.phone_number = '012345678'
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number は半角数値の10桁から11桁以内に入力してください")
      end
      it 'phone_numberは12桁以上では登録できない' do
        @address.phone_number = '012345678901'
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number は半角数値の10桁から11桁以内に入力してください")
      end
      
    end
  end
end
