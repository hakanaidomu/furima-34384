FactoryBot.define do
  factory :order_profile do
    postal_code  { '234-5678' }
    prefecture_id{ 4 }
    city         { '東京都渋谷区' }
    house_number { '渋谷ー１'}
    building_name{ '渋谷ビル'}
    tel          { '09012345677' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end