class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  with_options presence: true do
    validates :nickname, format: { with: /\A[a-z0-9]+\z/i, message: "は半角英数で入力してください。"}
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "は全角で入力してください。"}
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "は全角で入力してください。"}
    validates :family_name_kana, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "は全角カタカナで入力して下さい。"}
    validates :first_name_kana, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "は全角カタカナで入力して下さい。"}
    validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "は半角英数で入力してください。"}
    validates :encrypted_password, uniqueness: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "には英字と数字の両方を含めて設定してください。"}, length: { minimum: 6 }
  end
end
