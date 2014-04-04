BanquetManager::Application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    get 'sign_up', to: 'devise/registrations#new'
  end

  authenticated :user do
    root to: 'clients#index', as: :authenticated_root
  end

  unauthenticated do
    root to: 'homes#show'
  end

  resources :clients
  resource :home, only: [:show]
  resource :todolist, only: [:show]
  resource :commissions, only: [:show]
end
