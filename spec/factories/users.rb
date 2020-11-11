FactoryBot.define do
  factory :user do
    gimei = Gimei.name
    nickname { gimei.kanji }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    family_name { gimei.last.kanji }
    name { gimei.first.kanji }
    family_name_kana { gimei.last.katakana }
    name_kana { gimei.first.katakana }
    birthdate { Faker::Date.between(from: '2014-09-23', to: '2014-09-25') }
  end
end
