# frozen_string_literal: true

Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # TODO: override callback

  root to: 'home#index'
  get '*path', to: 'home#index'
end
