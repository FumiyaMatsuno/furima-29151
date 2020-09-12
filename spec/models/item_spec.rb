require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品登録' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('sample_test.png')
    end

    context '商品出品登録がうまくいくとき' do
      it '全部の値が入っていたら登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品登録がうまくいかないとき' do
      it '画像が空だと保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が無いとき登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品説明が無いと登録できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーを選択しないと登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'カテゴリーをid:1を選択していると登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it '商品の状態を選択していないと登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '商品の状態でid:1を選択していると登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 1')
      end

      it '配送料の負担をを選択しないと登録できない' do
        @item.postage_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end
      it '配送料の負担でid:1を選択しているとと登録できない' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Postage must be other than 1')
      end

      it '発送元の地域を選択しないと登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送元の地域でid:0を選択していると登録できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 0')
      end

      it '発送までの日数を選択しないと登録できない' do
        @item.sipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Sipping day can't be blank")
      end
      it '発送までの日数でid:1を選択していると登録できない' do
        @item.sipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Sipping day must be other than 1')
      end

      it '金額が無いと登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '金額が300円より小さいとだと登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '金額が9,999,999円より大きいと登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it '金額が半角数字でないと登録できない' do
        @item.price = '１２３４'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
