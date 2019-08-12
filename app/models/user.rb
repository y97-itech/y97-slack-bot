# frozen_string_literal: true

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

  def auth
    @slack_auth ||= access_auth_test
  end

  def user_info
    @slack_user_info ||= access_user_info
  end

  def team_info
    @slack_team_info ||= access_team_info
  end

  def slack_client
    @slack_client ||= Slack::Web::Client.new(token: access_token)
  end

  def slack_bot_client
    @slack_bot_client ||= Slack::Web::Client.new(token: bot_access_token)
  end

  private

  def access_auth_test
    slack_client.auth_test
  end

  def access_user_info
    slack_client.users_info(user: auth.user_id).user
  end

  def access_team_info
    slack_client.team_info(team: auth.team_id).team
  end
end
