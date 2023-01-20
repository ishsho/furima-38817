require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end


  describe '商品出品機能' do

    context '商品出品できるとき' do
      it 'image、item_name、content、category_id、state_id、load_id、area_id、
      shipping_date_id、priceが存在すれば登録できる' do
         expect(@item).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'imageが空では登録できない' do
      end
      it 'item_nameが空では登録できない' do
      end
      it 'contentが空では登録できない' do
      end
      it 'category_idが空では登録できない' do
      end
      it 'state_idが空では登録できない' do
      end
      it 'load_idが空では登録できない' do
      end
      it 'area_idが登録できない' do
      end
      it 'shipping_date_idが空では登録できない' do
      end
      it 'priceが空では登録できない' do
      end
    end
  end
end
