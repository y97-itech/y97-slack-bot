# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resource :session, only: %i[show destroy], controller: 'sessions'

  resources :users, only: %i[show]

  root to: 'home#index'
  get '*path', to: 'home#index'
end
