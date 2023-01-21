FactoryBot.define do
  factory :item do
    item_name             {'aaa'}
    content               {Faker::Lorem.sentence}
    category_id           {'2'}
    state_id              {'2'}
    load_id               {'2'}
    area_id               {'2'}
    shipping_date_id      {'2'}
    price                 {'5000'}

    association :user 

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
