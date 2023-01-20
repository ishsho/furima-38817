FactoryBot.define do
  factory :item do
    image                 {Faker::Lorem.sentence}
    item_name             {'aaa'}
    content               {Faker::Lorem.sentence}
    category_id           {'1'}
    state_id              {'1'}
    load_id               {'1'}
    area_id               {'1'}
    shipping_date_id      {'1'}
    price                 {'5000'}

    association :user 
  end
end
