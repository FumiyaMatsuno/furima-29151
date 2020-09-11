class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is Full-width characters' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is Full-width characters' }
    validates :family_name_kana, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'is Full-width characters' }
    validates :first_name_kana, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'is Full-width characters' }
    validates :birth_day
  end

  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "doesn't match Password" }

  has_many :items
end
