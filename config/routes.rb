BanquetManager::Application.routes.draw do
  resources :clients

  root 'clients#index'

  get 'six_week_schedule', to: 'todolist#six_week_schedule', as: :todolist

  post 'clients', to: 'clients#index', as: :clients_index
end
