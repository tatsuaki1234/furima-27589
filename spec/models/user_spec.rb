require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、family_name_kanjiとfirst_name_kanji、family_name_kanaとfirst_name_kana、day_of_birthが存在すれば登録できる' do
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
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'メールアドレスは、@を含む必要があること。' do
        @user.email = 'test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123abc'
        @user.password_confirmation = '1234ab'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'パスワードは、半角英数字混合での入力が必須であること' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password は英字と数字の組み合わせで入力して下さい。")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '123ab'
        @user.password_confirmation = '123ab'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it '名字が空では登録できない' do
        @user.family_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kanji can't be blank", "Family name kanji は漢字かひらがなかカタカナで入力して下さい。")
      end
      it '名前が空では登録できない' do
        @user.first_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji can't be blank", "First name kanji は漢字かひらがなかカタカナで入力して下さい。")
      end
      it 'カタカナ名字が空では登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank", "Family name kana はカタカナで入力して下さい。")
      end
      it 'カタカナ名前が空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana はカタカナで入力して下さい。")
      end
      it '名字に英字と数字だけでは登録できない' do
        @user.family_name_kanji = 'abc123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kanji は漢字かひらがなかカタカナで入力して下さい。")
      end
      it '名前に英字と数字を含むと登録できない' do
        @user.first_name_kanji = 'abc123'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji は漢字かひらがなかカタカナで入力して下さい。")
      end
      it 'カタカナ名字は英字と数字だけでは登録できない' do
        @user.family_name_kana = 'abc123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana はカタカナで入力して下さい。")
      end
      it 'カタカナ名前は英字と数字だけでは登録できない' do
        @user.first_name_kana = 'abc123'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana はカタカナで入力して下さい。")
      end
      it '生年月日がないと登録できない' do
        @user.day_of_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Day of birth can't be blank")
      end
    end
  end
end