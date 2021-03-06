Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :services, only: %i[index show new create] do
    resources :bookings, only: %i[show new create] do
      resources :reviews, only: %i[create]
    end
  end
  resources :bookings, only: %i[update destroy] do
    resources :evaluations, only: %i[new create show]
  end
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
  get "/dashboard", to: 'bookings#index', as: :dashboard
  get "/wheelpers", to: 'services#wheelpers', as: :wheelpers
end
