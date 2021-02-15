require 'rails_helper'

RSpec.describe OrderProfile, type: :model do
  describe '購入機能' do
    before do
      @order_profile = FactoryBot.build(:order_profile)
    end

    describe '購入'
    context '登録できること' do
      it 'postal_code,prefecture_id,city,house_number,tel,tokenの値が存在すれば登録できること' do
        expect(@order_profile).to be_valid
      end

      it 'building_nameが空でも登録できる' do
        @order_profile.building_name = nil
        expect(@order_profile).to be_valid
      end
    end

    context '登録できないこと' do
      it 'postal_codeが空では登録できない' do
        @order_profile.postal_code = nil
        @order_profile.valid?
        expect(@order_profile.errors.full_messages).to include('Postal code is invalid')
      end

      it 'postal_codeに-を入れないと登録できない' do
        @order_profile.postal_code = '1112222'
        @order_profile.valid?
        expect(@order_profile.errors.full_messages).to include('Postal code is invalid')
      end

      it 'prefecture_idが1だと登録できない' do
        @order_profile.prefecture_id = 1
        @order_profile.valid?
        expect(@order_profile.errors.full_messages).to include('Prefecture Select')
      end

      it 'cityが空では登録できない' do
        @order_profile.city = nil
        @order_profile.valid?
        expect(@order_profile.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空では登録できない' do
        @order_profile.house_number = nil
        @order_profile.valid?
        expect(@order_profile.errors.full_messages).to include("House number can't be blank")
      end

      it 'telが空では登録できない' do
        @order_profile.tel = nil
        @order_profile.valid?
        expect(@order_profile.errors.full_messages).to include("Tel can't be blank")
      end

      it 'telに-があると登録できない' do
        @order_profile.tel = '111-1111-111'
        @order_profile.valid?
        expect(@order_profile.errors.full_messages).to include('Tel is invalid')
      end

      it 'telが12桁以上だと登録できない' do
        @order_profile.tel = '112233445566'
        @order_profile.valid?
        expect(@order_profile.errors.full_messages).to include('Tel is invalid')
      end

      it 'tokenが空では登録できないこと' do
        @order_profile.token = nil
        @order_profile.valid?
        expect(@order_profile.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
