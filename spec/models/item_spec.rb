require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


  describe '商品新規登録' do
    context '商品新規登録できるとき' do
      it 'name、content、image、category_id、condition_id、postage_id、area_id、send_id、priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
  end
end
