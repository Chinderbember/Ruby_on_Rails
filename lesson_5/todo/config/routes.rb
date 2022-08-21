# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users', to: 'users#index'
  resources :events
  get 'about', to: 'about#index', as: 'about_index'
  get 'about/:hello', to: 'about#index', additional: 'true'
  root 'events#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
