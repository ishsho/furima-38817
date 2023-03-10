require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do

      it 'nicknameとemail、passwordとpassword_confirmation、family_name_japaneseとfirst_name_japanese、
      family_name_katakanaとfirst_name_katakana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end

    end

    context '新規登録できないとき' do

      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end

      it 'family_name_japaneseが空では登録できない' do
        @user.family_name_japanese =''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字(全角)を入力してください")
      end

      it 'first_name_japaneseが空では登録できない' do
        @user.first_name_japanese =''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(全角)を入力してください")
      end

      it 'family_name_katakanaが空では登録できない' do
        @user.family_name_katakana =''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字カナ(全角)を入力してください")
      end

      it 'first_name_katakanaが空では登録できない' do
        @user.first_name_katakana =''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前カナ(全角)を入力してください")
      end

      it 'family_name_japaneseは、全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.family_name_japanese = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字(全角)は不正な値です")        
      end

      it 'first_name_japaneseは、全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.first_name_japanese = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前(全角)は不正な値です")
      end

      it 'family_name_katakanaは、全角でないと登録できない' do
        @user.family_name_katakana = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字カナ(全角)は不正な値です")
      end

      it 'first_name_katakanaは、全角でないと登録できない' do
        @user.first_name_katakana = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前カナ(全角)は不正な値です")
      end

      it 'birthdayが空では登録できない' do
        @user.birthday =''
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end

      it 'passwordは全角英数字混合では登録できない' do
        @user.password = 'ａａ１１１１'
        @user.password_confirmation = 'ａａ１１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end

      it '英字のみのpasswordでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end

      it '数字のみのpasswordでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end

    end
  end

end
