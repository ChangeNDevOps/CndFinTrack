Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  resource :registration, only: %i[new create]
  get 'locations/provinces', to: 'locations#provinces'
  mount RailsIcons::Engine, at: '/rails_icons'
  get 'home/index'
  get 'up' => 'rails/health#show', as: :rails_health_check
  namespace :member do
    root 'dashboard#index'
    resources :companies do
      resources :customers
      resources :tags
      resources :categories
      resources :suppliers
      resources :expenses
      resources :products
      resources :quotes do
        member do
          patch :approve
          patch :reject
        end
      end
      resources :invoices
      resources :payments
    end
    resources :teams
  end
  root 'sessions#new'
end
