require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end


  describe '商品新規登録' do
    context '商品新規登録できるとき' do
      it 'name、content、image、category_id、condition_id、postage_id、area_id、scheduled_delivery_id、priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end

      context '商品登録できないとき' do
        it 'nameが空では登録できない' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("商品名を入力してください")
        end
        it 'imageが空では登録できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("画像を入力してください")
        end
        it 'contentが空では登録できない' do
          @item.content = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("商品説明分を入力してください")
        end          
        it 'category_idが空では登録できない' do
          @item.category_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("商品カテゴリーは---以外を入力してください")
        end          
        it 'condition_idが空では登録できない' do
          @item.condition_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("商品状態は---以外を入力してください")
        end          
        it 'postage_idが空では登録できない' do
          @item.postage_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("発送方法は---以外を入力してください")
        end          
        it 'area_idが空では登録できない' do
          @item.area_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("発送元地域は---以外を入力してください")
        end          
        it 'scheduled_delivery_idが空では登録できない' do
          @item.scheduled_delivery_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("発送元地域は---以外を入力してください")
        end          
        it 'priceが空では登録できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("商品金額を入力してください")
        end
        it 'priceが299以下では登録できない' do
          @item.price = '299'
          @item.valid?
          expect(@item.errors.full_messages).to include("商品金額は300以上の値にしてください")
        end          
        it 'priceが10,000,000以上では登録できない' do
          @item.price = '10000000'
          @item.valid?
          expect(@item.errors.full_messages).to include("商品金額は9999999以下の値にしてください")
        end   
        it '価格に半角数字以外が含まれている場合は出品できない' do
          @item.price = '12345６78'
          @item.valid?
          expect(@item.errors.full_messages).to include("商品金額は数値で入力してください")
        end   
        it '価格に半角少数字が含まれている場合は出品できない' do
          @item.price = '100.5'
          @item.valid?
          expect(@item.errors.full_messages).to include("商品金額は整数で入力してください")
        end   
        it 'userが紐付いていなければ出品できない' do
          @item.user = nil
          @item.valid?

          expect(@item.errors.full_messages).to include("ユーザーを入力してください")
        end          
      end
    end
  end
end


