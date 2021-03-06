# frozen_string_literal: true

class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def slack
    @user = User.authorized_by_slack(request.env['omniauth.auth'])

    if @user.persisted?
      # sign_in_and_redirect @user, event: :authentication # this will throw if @user is not activated
      sign_in @user, event: :authentication
      redirect_to request.env['omniauth.origin'] || '/'
      set_flash_message(:notice, :success, kind: 'Slack') if is_navigational_format?
    else
      logger.debug('auth error')
      redirect_to 'error'
    end
  end

  def after_omniauth_failure_path_for(scope)
    '/auth'
  end
end
