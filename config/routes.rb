Rails.application.routes.draw do

  root to: 'home#index'
  devise_for :users
  resources :users, only: [:show]
  get 'ranking', to: 'users#ranking'

  resources :towns, only: [:show] do
    resources :denounces, only: [:create]
  end

  authenticated :user do
    root to: 'towns#show', defaults: { id: 1 }, as: :authenticated_root
  end
  root to: 'home#index', as: :unauthenticated_root

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
