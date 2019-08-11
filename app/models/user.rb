# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :trackable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  def self.authorized_by_slack(auth)
    user = User.find_or_initialized_by(uid: auth.uid, provider: :slack)
    user.access_token = auth.credentials.token
    user.bot_access_token = auth.extra.bot_info.bot_access_token
    user.save && user
  end
end
