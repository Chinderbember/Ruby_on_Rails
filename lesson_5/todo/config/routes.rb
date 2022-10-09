# frozen_string_literal: true

Rails.application.routes.draw do
  get :toggle, to: 'locales#toggle'
  namespace :admin do
    resources :roles
  end

  namespace :admin do
    root 'users#index'
    resources :users do
      member do
        post :toggle, action: :toggle
      end
    end
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy', as: 'destroy_user_session_v2'
  end

  resources :events do
    resources :items
  end

  root 'events#index'

  get 'about', to: 'about#index'

  get 'about/help', to: 'about#help', as: 'help'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
