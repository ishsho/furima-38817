require 'rails_helper'

RSpec.describe OrderTransact, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_transact = FactoryBot.build(:order_transact, user_id: user.id, item_id: item.id)
      config.active_job.queue_adapter = :inline
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
        expect(@order_transact.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_transact.postal_code = '1111111'
        @order_transact.valid?
        expect(@order_transact.errors.full_messages).to include("Postal code is invalid")
      end

      it 'area_idを選択していないと保存できないこと' do
        @order_transact.area_id = '1'
        @order_transact.valid?
        expect(@order_transact.errors.full_messages).to include("Area can't be blank")
      end

      it 'municipalitiesが空だと保存できないこと' do
        @order_transact.municipalities = ''
        @order_transact.valid?
        expect(@order_transact.errors.full_messages).to include("Municipalities can't be blank")
      end

      it 'adressが空だと保存できないこと' do
        @order_transact.adress = ''
        @order_transact.valid?
        expect(@order_transact.errors.full_messages).to include("Adress can't be blank")
      end

      it 'phoneが空だと保存できないこと' do
        @order_transact.phone = ''
        @order_transact.valid?
        expect(@order_transact.errors.full_messages).to include("Phone can't be blank")
      end

      it 'phoneが9桁以下では保存できないこと' do
        @order_transact.phone = '11111111'
        @order_transact.valid?
        expect(@order_transact.errors.full_messages).to include("Phone is invalid")
      end

      it 'phoneが12桁以上では保存できないこと' do
        @order_transact.phone = '111111111111'
        @order_transact.valid?
        expect(@order_transact.errors.full_messages).to include("Phone is invalid")
      end

      it 'phoneにハイフン(-)が記載されると保存できないこと' do
        @order_transact.phone = '111-1111-1111'
        @order_transact.valid?
        expect(@order_transact.errors.full_messages).to include("Phone is invalid")
      end

      it 'userが紐付いていないと保存できないこと' do
        @order_transact.user_id = nil
        @order_transact.valid?
        expect(@order_transact.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていないと保存できないこと' do
        @order_transact.item_id = nil
        @order_transact.valid?
        expect(@order_transact.errors.full_messages).to include("Item can't be blank")
      end

      it "tokenが空では登録できないこと" do
        @order_transact.token = nil
        @order_transact.valid?
        expect(@order_transact.errors.full_messages).to include("Token can't be blank")
      end

    end
  end
end
