BanquetManager::Application.routes.draw do
  devise_for :users
  devise_scope :user do
    get "sign_in", to: 'devise/sessions#new'
    get 'sign_up', to: 'devise/registrations#new'
  end
  
  authenticated :user do
    root to: 'clients#index', as: :authenticated_root
  end

  unauthenticated do
    root to: 'main#main'
  end

  resources :clients
  get 'main', to: 'main#main', as: :main
  get 'six_week_schedule', to: 'todolist#six_week_schedule', as: :todolist
  get 'commissions', to: 'commissions#commissions', as: :commissions

  post 'clients', to: 'clients#index', as: :clients_index
end
