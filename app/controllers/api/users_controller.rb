# frozen_string_literal: true

class Api::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def show
    render json: @user.user_info
  end

  private

  def set_user
    if (user_id = params[:id].to_i) == 0
      @user = current_user
    else
      @user = User.find(user_id)
    end
  end
end
