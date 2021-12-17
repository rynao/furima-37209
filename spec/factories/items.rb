FactoryBot.define do
  factory :item do
    item_name     { 'test' }
    price         { '1000' }
    description   { 'テストテキスト' }
    category_id   { '2' }
    condition_id  { '2' }
    ship_cost_id  { '2' }
    prefecture_id { '2' }
    ship_date_id  { '2' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
