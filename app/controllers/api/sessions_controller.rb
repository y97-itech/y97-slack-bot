# frozen_string_literal: true

class Api::SessionsController < ApplicationController
  def show
    if user_signed_in?
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
    if user_signed_in?
      logger.debug('signed in, then out!')
      sign_out :user
    end
  end
end
