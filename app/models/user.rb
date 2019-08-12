class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: %i[slack]

  validates :provider, :uid, :access_token, :bot_access_token, presence: true

  def self.authorized_by_slack(auth)
    user = find_or_initialize_by(provider: auth.provider, uid: auth.uid)
    user.access_token = auth.credentials.token
    user.bot_access_token = auth.extra.bot_info.bot_access_token
    user.save && user
  end
end
