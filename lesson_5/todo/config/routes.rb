# frozen_string_literal: true

Rails.application.routes.draw do
  get 'about', to: 'about#index'
  root 'events#index'
  get 'help', to: 'about#help'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
