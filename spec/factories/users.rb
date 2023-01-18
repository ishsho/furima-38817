FactoryBot.define do
  factory :user do
      nickname              {Faker::Name.initials(number: 2)}
      email                 {Faker::Internet.free_email}
      password              {'a11111'}
      password_confirmation {password}
      family_name_japanese  {'山田'}
      first_name_japanese   {'太郎'}
      family_name_katakana  {'ヤマダ'}
      first_name_katakana   {'タロウ'}
      birthday              {'2000-01-01'}
  end
end
