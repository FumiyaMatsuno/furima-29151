FactoryBot.define do
  factory :user do
    nickname { 'abe' }
    email { Faker::Internet.free_email }
    password { 'abc123' }
    password_confirmation { password }
    family_name { '山田' }
    first_name { '陸太郎' }
    family_name_kana { 'ヤマダ' }
    first_name_kana { 'リクタロウ' }
    birth_day { '2000-02-03' }
  end
end
