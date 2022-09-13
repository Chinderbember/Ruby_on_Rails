# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :roles
  end
  namespace :admin do
    root 'users#index'
    resources :users
  end
  patch '/admin_users_control/show/:id', to: 'users#update'
  get '/admin_users_control/show/:id', to: 'users#show', as: 'user'
  get '/admin_users_control/new', to: 'users#new', as: 'new_user'
  get '/admin_users_control/:id(.:format)', to: 'users#destroy', as: 'destroy_user'
  resources :users, path: 'admin_users_control'

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

  get 'about', to: 'about#index', as: 'about'
  get 'about/help', to: 'about#help', as: 'help'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
