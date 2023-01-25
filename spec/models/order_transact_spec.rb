require 'rails_helper'

RSpec.describe OrderTransact, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_transact = FactoryBot.build(:order_transact, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
      end

      it 'buildingは空でも保存できること' do
      end

    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      end

      it 'area_idを選択していないと保存できないこと' do
      end

      it 'municipalitiesが空だと保存できないこと' do
      end

      it 'adressが空だと保存できないこと' do
      end

      it 'phoneが空だと保存できないこと' do
      end

      it 'phoneが9桁以下では保存できないこと' do
      end

      it 'phoneが12桁以上では保存できないこと' do
      end

      it 'phoneにハイフン(-)が記載されると保存できないこと' do
      end

      it 'userが紐付いていないと保存できないこと' do
      end

      it 'itemが紐付いていないと保存できないこと' do
      end

    end
  end
end
