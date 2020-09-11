FactoryBot.define do
  factory :item do
    association :user
    association :category
    association :condition
    association :postage
    association :prefecture
    association :sipping_day

    name { '商品名' }
    description { '商品の説明' }
    category_id { '2' }
    condition_id { '2' }
    postage_id { '2' }
    sipping_day_id { '2' }
    prefecture_id { '2' }
    price { '2000' }
  end
end
