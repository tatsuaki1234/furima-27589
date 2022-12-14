require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order_address)
  end

  describe '商品新規登録' do
    context '商品新規登録できるとき' do
      it 'userが紐付いていなければ購入できない' do
        @order.user = nil
        @order.valid?
        binding.pry
        expect(@order.errors.full_messages).to include("User must exist")
      end    
    end
  end






end