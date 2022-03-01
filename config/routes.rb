Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :services, only: %i[index show new create] do
    resources :bookings, only: %i[show new]
  end
  resources :bookings, only: %i[index create edit update destroy]
end
