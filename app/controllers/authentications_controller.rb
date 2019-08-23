# frozen_string_literal: true

class AuthenticationsController < ApplicationController
  skip_before_action :authenticate!

  def new
  end
end
