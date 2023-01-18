require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do

      it 'nicknameとemail、passwordとpassword_confirmation、family_name_japaneseとfirst_name_japanese、
      family_name_katakanaとfirst_name_katakana、birthdayが存在すれば登録できる' do

      end

    end
    context '新規登録できないとき' do

      it 'nicknameが空では登録できない' do
      end

      it 'emailが空では登録できない' do
      end

      it 'passwordが空では登録できない' do
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
      end

      it 'family_name_japaneseが空では登録できない' do
      end

      it 'first_name_japaneseが空では登録できない' do
      end

      it 'family_name_katakanaが空では登録できない' do
      end

      it 'first_name_katakanaが空では登録できない' do
      end

      it 'family_name_japaneseは、全角（漢字・ひらがな・カタカナ）でないと登録できない' do
      end

      it 'first_name_japaneseは、全角（漢字・ひらがな・カタカナ）でないと登録できない' do
      end

      it 'first_name_katakanaは、全角でないと登録できない' do
      end

      it 'first_name_katakanaは、全角でないと登録できない' do
      end

      it 'birthdayが空では登録できない' do
      end

      it '重複したemailが存在する場合は登録できない' do
      end

      it 'emailは@を含まないと登録できない' do
      end

      it 'passwordが5文字以下では登録できない' do
      end

      it 'passwordが半角英数字混合でないと登録できない' do
      end

    end
  end

end
