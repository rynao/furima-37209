require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe 'クレジットカードでの購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '購入できる場合' do
      it 'すべての値が正しく入力されていればできる' do
        expect(@purchase_address).to be_valid
      end
      it 'buildingは空でも購入できる' do
        @purchase_address.building = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '購入できない場合' do
      it 'post_codeが空では購入できない' do
        @purchase_address.post_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが3桁数値ハイフン4桁数値の形式でないと購入できない' do
        @purchase_address.post_code = '1112222'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'post_codeが全角では購入できない' do
        @purchase_address.post_code = '１１１-２２２２'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'prefectureを選択していないと購入できない' do
        @purchase_address.prefecture_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが1では登録できない' do
        @purchase_address.prefecture_id = '1'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では購入できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it 'address_lineが空では購入できない' do
        @purchase_address.address_line = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address line can't be blank")
      end
      it 'telephoneが空では購入できない' do
        @purchase_address.telephone = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone can't be blank")
      end
      it 'telephoneが10桁未満の数値では購入できない' do
        @purchase_address.telephone = '123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone is invalid. Input only number")
      end
      it 'telephoneが12桁以上の数値では購入できない' do
        @purchase_address.telephone = '123456789012'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone is invalid. Input only number")
      end
      it 'telephoneが全角では購入できない' do
        @purchase_address.telephone = '１２３４５６７８９０'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone is invalid. Input only number")
      end
      it 'telephoneにハイフンが入っていては購入できない' do
        @purchase_address.telephone = '123-456-789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone is invalid. Input only number")
      end
      it 'telephoneは半角英数字混合では購入できない' do
        @purchase_address.telephone = 'abcde12345'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone is invalid. Input only number")
      end
      it 'tokenが空では購入できない' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token is invalid.Credit card data can't be blank")
      end
      it 'userが紐付いていないと購入できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと購入できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
