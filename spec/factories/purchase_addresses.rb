FactoryBot.define do
  factory :purchase_address do
    post_code { '123-4567' }
    prefecture_id { '2' }
    city { '横浜市' }
    address_line { '1-1-1' }
    building { '横浜ビル' }
    telephone { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
