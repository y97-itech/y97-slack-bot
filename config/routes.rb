# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'omniauth_callbacks'
  }

  get 'auth', to: 'authentications#new'

  namespace :api, defaults: { format: 'json' } do
    resource :session, only: %i[show destroy]
    resources :users, only: %i[show]
  end

  root to: 'home#index'
  get '*path', to: 'home#index'
end
