Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :conveyings do
    resources :bookings, only: :create
  end
  resources :bookings, only: [:edit, :destroy] do
      get '/accept', to: 'bookings#accept'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'dashboard', to: 'pages#dashboard'
end
