require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it "nickname,,email,first_name,last_name,first_name_kana,last_name_kana,birthday,
        password,password_confirmationが存在すれば登録できる" do
          expect(@user).to be_valid
        end
        it 'passwordが６文字以上の半角英数字であれば登録できる' do
          @user.password = '111aaa'
          @user.password_confirmation = '111aaa'
          expect(@user).to be_valid
        end
      end
    end

    describe '新規登録がうまく行かないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailがある場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailに@が含まれていないとユーザー登録できない' do
        @user.email = 'aaabbb'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'first_nameが空では登録できないこと' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'last_nameが空では登録できないこと' do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it 'first_nameが全角（漢字・ひらがな・カタカナ）以外だとユーザー登録できない' do
        @user.first_name = 'furima'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end

      it 'last_nameが全角（漢字・ひらがな・カタカナ）以外だとユーザー登録できない' do
        @user.last_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end

      it 'first_name_kanaが全角（カタカナ）以外だとユーザー登録できない' do
        @user.first_name_kana = 'ふりま'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end

      it 'last_name_kanaが全角（カタカナ）以外だとユーザー登録できない' do
        @user.last_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end

      it 'passwordが空では登録できないこと' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下であれば登録できない' do
        @user.password = 'aaabb'
        @user.password_confirmation = 'aaabb'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)', 'Password 6文字以上の半角英数字')
      end

      it 'passwordが半角英字のみだとユーザー登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 6文字以上の半角英数字')
      end

      it 'passwordが半角数字のみだとユーザー登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 6文字以上の半角英数字')
      end
      
      it 'passwordが全角のみだとユーザー登録できない' do
        @user.password = '全角用のテスト'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 6文字以上の半角英数字')
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'aaa111'
        @user.password_confirmation = '111aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'birthdayが空では登録できないこと' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
