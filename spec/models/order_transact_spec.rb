require 'rails_helper'

RSpec.describe OrderTransact, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_transact = FactoryBot.build(:order_transact, user_id: user.id, item_id: item.id)
      sleep(0.1)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_transact).to be_valid
      end

      it 'buildingは空でも保存できること' do
        @order_transact.building = ''
        expect(@order_transact).to be_valid
      end

    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order_transact.postal_code = ''
        @order_transact.valid?
        expect(@order_transact.errors.full_messages).to include("郵便番号を入力してください")
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_transact.postal_code = '1111111'
        @order_transact.valid?
        expect(@order_transact.errors.full_messages).to include("郵便番号は不正な値です")
      end

      it 'area_idを選択していないと保存できないこと' do
        @order_transact.area_id = '1'
        @order_transact.valid?
        expect(@order_transact.errors.full_messages).to include("都道府県を入力してください")
      end

      it 'municipalitiesが空だと保存できないこと' do
        @order_transact.municipalities = ''
        @order_transact.valid?
        expect(@order_transact.errors.full_messages).to include("市区町村を入力してください")
      end

      it 'adressが空だと保存できないこと' do
        @order_transact.adress = ''
        @order_transact.valid?
        expect(@order_transact.errors.full_messages).to include("番地を入力してください")
      end

      it 'phoneが空だと保存できないこと' do
        @order_transact.phone = ''
        @order_transact.valid?
        expect(@order_transact.errors.full_messages).to include("電話番号を入力してください")
      end

      it 'phoneが9桁以下では保存できないこと' do
        @order_transact.phone = '11111111'
        @order_transact.valid?
        expect(@order_transact.errors.full_messages).to include("電話番号は不正な値です")
      end

      it 'phoneが12桁以上では保存できないこと' do
        @order_transact.phone = '111111111111'
        @order_transact.valid?
        expect(@order_transact.errors.full_messages).to include("電話番号は不正な値です")
      end

      it 'phoneにハイフン(-)が記載されると保存できないこと' do
        @order_transact.phone = '111-1111-1111'
        @order_transact.valid?
        expect(@order_transact.errors.full_messages).to include("電話番号は不正な値です")
      end

      it 'userが紐付いていないと保存できないこと' do
        @order_transact.user_id = nil
        @order_transact.valid?
        expect(@order_transact.errors.full_messages).to include("購入者情報を入力してください")
      end

      it 'itemが紐付いていないと保存できないこと' do
        @order_transact.item_id = nil
        @order_transact.valid?
        expect(@order_transact.errors.full_messages).to include("商品情報を入力してください")
      end

      it "tokenが空では登録できないこと" do
        @order_transact.token = nil
        @order_transact.valid?
        expect(@order_transact.errors.full_messages).to include("クレジットカード情報を入力してください")
      end

    end
  end
end
