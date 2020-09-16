require 'rails_helper'

describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nickname,family_name,first_name,family_name_kana,first_name_kana,birth_day,password,password_confirmationが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameがない場合は登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'family_nameがない場合は登録できないこと' do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end

    it 'first_nameがない場合は登録できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'family_name_kanaがない場合は登録できないこと' do
      @user.family_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end

    it 'first_name_kanaがない場合は登録できないこと' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'birth_dayがない場合は登録できないこと' do
      @user.birth_day = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end

    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordが6文字以上であれば登録できる' do
      @user.password = 'abc123'
      @user.password_confirmation = 'abc123'
      expect(@user).to be_valid
    end

    it 'passwordが5文字以下であれば登録できないこと', 'passwordが英数字でない場合は登録できないこと' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password doesn't match Password", 'Password is too short (minimum is 6 characters)')
    end

    it 'passwordが英数字である場合は登録できる' do
      @user.password = 'abc123'
      @user.valid?
      expect(@user).to be_valid
    end

    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailが@を含んでいる場合は登録できる' do
      @user.email = 'xxxx@gmail.com'
      @user.valid?
      expect(@user).to be_valid
    end

    it 'family_nameが全角である場合は登録できること' do
      @user.family_name = '山田'
      @user.valid?
      expect(@user).to be_valid
    end

    it 'family_nameが全角でない場合は登録できないこと' do
      @user.family_name = 'ﾔﾏﾀﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name is Full-width characters')
    end

    it 'first_nameが全角である場合は登録できること' do
      @user.first_name = '陸太郎'
      @user.valid?
      expect(@user).to be_valid
    end

    it 'first_nameが全角でない場合は登録できないこと' do
      @user.first_name = 'ﾘｸﾀﾛｳ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is Full-width characters')
    end

    it 'family_name_kanaが全角カタカナである場合は登録できること' do
      @user.family_name_kana = 'ヤマダ'
      @user.valid?
      expect(@user).to be_valid
    end

    it 'family_name_kanaが全角でない場合は登録できないこと' do
      @user.family_name_kana = 'ﾔﾏﾀﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name kana is  Full-width katakana characters')
    end

    it 'family_name_kanaがカタカナでない場合は登録できないこと' do
      @user.family_name_kana = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name kana is  Full-width katakana characters')
    end

    it 'first_name_kanaが全角カタカナである場合は登録できること' do
      @user.first_name_kana = 'タロウ'
      @user.valid?
      expect(@user).to be_valid
    end

    it 'first_name_kanaが全角でない場合は登録できないこと' do
      @user.first_name_kana = 'ﾘｸﾀﾛｳ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is  Full-width katakana characters')
    end

    it 'first_name_kanaがカタカナでない場合は登録できないこと' do
      @user.first_name_kana = 'rikutarou'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is  Full-width katakana characters')
    end
  end
end
