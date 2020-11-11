require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    it '全ての項目が存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailに＠が入っていないと登録できないこと' do
      @user.email = 'sdhfjsdkasdf'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'emailに同一のemailが入っていると登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
      @user.password_confirmation = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end
    it 'passwordが6文字以下では登録できないこと' do
      @user.password = 'dhsd'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが半角英数字混合でないと登録できないこと' do
      @user.password = 'sdasdfasdf'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'ユーザー本名の名字と名前が空では登録できないこと' do
      @user.family_name = nil
      @user.valid?
      binding.pry
      expect(@user.errors.full_messages).to include("Family name can't be blank")
      @user.name = nil
      @user.valid?
      binding.pry
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end
    it 'ユーザー本名のフリガナが、名字と名前が空では登録できないこと' do
      @user.family_name_kana = nil
      @user.valid?
      binding.pry
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      @user.name_kana = nil
      @user.valid?
      binding.pry
      expect(@user.errors.full_messages).to include("Name kana can't be blank")
    end

    it '生年月日が空では登録できないこと' do
      @user.birthdate = nil
      @user.valid?
      binding.pry
      expect(@user.errors.full_messages).to include("Birthdate can't be blank")
    end

    it 'ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること' do
      @user.family_name = 'psssasdf'
      @user.valid?
      binding.pry
      expect(@user.errors.full_messages).to include('Family name is invalid')

      @user.name = 'psssasdf'
      @user.valid?
      binding.pry
      expect(@user.errors.full_messages).to include('Name is invalid')
    end

    it 'ユーザー本名は全角（カタカナ）で入力させること' do
      @user.family_name_kana = 'さとう'
      @user.valid?
      binding.pry
      expect(@user.errors.full_messages).to include('Family name kana is invalid')

      @user.name_kana = 'ゆうた'
      @user.valid?
      binding.pry
      expect(@user.errors.full_messages).to include('Name kana is invalid')
    end
  end
end

