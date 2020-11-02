class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

         has_many :sns_credentials
         has_many :order
         has_many :item
        # ユーザー情報の実装条件
        NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/
        NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/
        PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
        EMAIL_REGEX = /@.+/
        validates :nickname,
                  presence: true
        validates :family_name,
                  presence: true, format: { with: NAME_REGEX }
        validates :name,
                  presence: true, format: { with: NAME_REGEX }
        validates :family_name_kana,
                  presence: true, format: { with: NAME_KANA_REGEX }
        validates :name_kana,
                  presence: true, format: { with: NAME_KANA_REGEX }
        validates :birthdate,
                  presence: true
        validates :password,
                  presence: true, length: { minimum: 6 }, format: { with: PASSWORD_REGEX }
        validates :password_confirmation,
                  presence: true, length: { minimum: 6 }, format: { with: PASSWORD_REGEX }
        validates :email, presence: true, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false }

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    # userが登録済みであるか判断
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
end
