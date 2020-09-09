class Item < ApplicationRecord
  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }
    validates :postage_id, numericality: { other_than: 1 }
    validates :price, numericality: { greater_than_or_equal_to: 300 }
    validates :category_id, numericality: { other_than: 1 }
    validates :sipping_day_id, numericality: { other_than: 1 }
    validates :condition_id, numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 1 }
  end
  belongs_to :user
  has_one_attached :image
end
