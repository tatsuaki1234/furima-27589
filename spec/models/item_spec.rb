require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end


  describe '商品新規登録' do
    context '商品新規登録できるとき' do
      it 'name、content、image、category_id、condition_id、postage_id、area_id、scheduled_delivery_id、priceが存在すれば登録できる' do
        # binding.pry
        expect(@item).to be_valid
      end

      context '商品登録できないとき' do
        it 'nameが空では登録できない' do
          @item.name = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it 'imageが空では登録できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end
        it 'contentが空では登録できない' do
          @item.content = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Content can't be blank")
        end          
        it 'category_idが空では登録できない' do
          @item.category_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end          
        it 'condition_idが空では登録できない' do
          @item.condition_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Condition can't be blank")
        end          
        it 'postage_idが空では登録できない' do
          @item.postage_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Postage can't be blank")
        end          
        it 'area_idが空では登録できない' do
          @item.area_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Area can't be blank")
        end          
        it 'scheduled_delivery_idが空では登録できない' do
          @item.scheduled_delivery_id = '1'
          @item.valid?
          expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
        end          
        it 'priceが空では登録できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        it 'priceが299以下では登録できない' do
          @item.price = '299'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
        end          
        it 'priceが10,000,000以上では登録できない' do
          @item.price = '10000000'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
        end   
        it '価格に半角数字以外が含まれている場合は出品できない' do
          @item.price = '12345６78'
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end   
        it 'userが紐付いていなければ出品できない' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("User must exist")
        end          
      end
    end
  end
end


