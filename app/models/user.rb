class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  with_options presence: true do
    validates :nickname
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is Full-width characters' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is Full-width characters' }
    validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is  Full-width katakana characters' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is  Full-width katakana characters' }
    validates :birth_day
  end

  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "doesn't match Password" }

  has_many :items
  has_many :orders
  has_many :sns_credentials

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = sns.user || User.where(email: auth.info.email).first_or_initialize(
    nickname: auth.info.name,
    email: auth.info.email
  )
  # userが登録済みの場合はそのままログインの処理へ行くので、ここでsnsのuser_idを更新しておく
  if user.persisted?
    sns.user = user
    sns.save
  end
  # userとsnsをハッシュで返すようにする
  { user: user, sns: sns }
  end
end
