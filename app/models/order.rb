class Order < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # attr_accessor :token, :post_code, :prefecture_id, :city, :address, :phone_number, :building_name, :item_id
  attr_accessor :token

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
  end

  belongs_to_active_hash :prefecture
  belongs_to :user
  belongs_to :item
end
