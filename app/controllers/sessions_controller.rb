# frozen_string_literal: true

class SessionsController < ApplicationController
  def show
    if signed_in? :user
      render json: {
        auth: true,
        user: current_user.user_info,
        team: current_user.team_info,
      }
    else
      render json: { auth: false }
    end
  end

  def destroy
    if signed_in? :user
      logger.debug('signed in, then out!')
      sign_out :user
    end
  end
end
