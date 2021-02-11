require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '出品機能' do
      context '出品できる' do
        it 'image,title,about,category_id,status_id,delivery_fee_id,prefecture_id,delivery_days_idの値が存在すれば出品できる' do
          expect(@item).to be_valid
        end
      end

      context '出品できない' do
        it 'imageが空では出品できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it 'titleが空では出品できない' do
          @item.title = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Title can't be blank")
        end

        it 'aboutが空では出品できない' do
          @item.about = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("About can't be blank")
        end

        it 'category_idが空では出品できない' do
          @item.category_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
        end

        it 'status_idが空では出品できない' do
          @item.status_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Status can't be blank")
        end

        it 'delivery_fee_idが空では出品できない' do
          @item.delivery_fee_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
        end

        it 'prefecture_idが空では登録できない' do
          @item.prefecture_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank")
        end

        it 'delivery_day_idが空では登録できない' do
          @item.delivery_day_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery day can't be blank")
        end

        it 'priceが299だと登録できない' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
        end

        it 'priceが10000000だと登録できない' do
          @item.price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
        end


        it 'priceが半角英語だけでは登録できない' do
          @item.price = 'aaa'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not a number')
        end

        it 'priceが半角英数混合では登録できない' do
          @item.price = 'aaa111'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not a number')
        end

        it 'priceが全角文字では登録できない' do
          @item.price = '１１１１１'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not a number')
        end

        it 'priceが空の場合登録できない' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('Price is not a number')
        end

        it 'category_idが1だと登録できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Category must be other than 1')
        end

        it 'status_idが1だと登録できない' do
          @item.status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Status must be other than 1')
        end

        it 'delivery_fee_idが1だと登録できない' do
          @item.delivery_fee_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Delivery fee must be other than 1')
        end

        it 'prefecture_idが1だと登録できない' do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
        end

        it 'delivery_day_idが1だと登録できない' do
          @item.delivery_day_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Delivery day must be other than 1')
        end
      end
    end
  end
end
