Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  get 'ranking', to: 'users#ranking'

  resources :towns, only: [:show] do
    resources :denounces, only: [:create]
  end

  authenticated :user do
    # In the future there may be more towns, so the root page will be for selecting town
    # For now there is only one town so root page goes directly to this town show page
    root to: 'towns#show', defaults: { id: Town.first_or_one }, as: :authenticated_root
  end
  root to: 'home#index', as: :unauthenticated_root

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
