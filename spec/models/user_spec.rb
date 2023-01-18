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
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'family_name_japaneseが空では登録できない' do
        @user.family_name_japanese =''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name japanese can't be blank")
      end

      it 'first_name_japaneseが空では登録できない' do
        @user.first_name_japanese =''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name japanese can't be blank")
      end

      it 'family_name_katakanaが空では登録できない' do
        @user.family_name_katakana =''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name katakana can't be blank")
      end

      it 'first_name_katakanaが空では登録できない' do
        @user.first_name_katakana =''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana can't be blank")
      end

      it 'family_name_japaneseは、全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.family_name_japanese = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name japanese is invalid")        
      end

      it 'first_name_japaneseは、全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.first_name_japanese = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name japanese is invalid")        
      end

      it 'family_name_katakanaは、全角でないと登録できない' do
        @user.family_name_katakana = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name katakana is invalid")
      end

      it 'first_name_katakanaは、全角でないと登録できない' do
        @user.first_name_katakana = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana is invalid")
      end

      it 'birthdayが空では登録できない' do
        @user.birthday =''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが半角英数字混合でないと登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it '英字のみのpasswordでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it '数字のみのpasswordでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

    end
  end

end
