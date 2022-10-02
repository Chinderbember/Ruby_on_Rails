# frozen_string_literal: true

module Routing
  def new_admin_panel
    namespace :admin do
      root 'users#index'
      resources :users do
        member do
          post :toggle, action: :toggle
        end
      end
    end
  end
end
