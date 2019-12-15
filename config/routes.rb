Rails.application.routes.draw do

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#newsfeed'

  resources :spots

  resources :users

  resources :lists

  resources :maps

  resources :visiteds, only: [:index, :destroy]

  resources :wishlists, only: [:index, :destroy]

  resources :geolocation, only: [:index]

  resources :spots, only: [:show, :index] do
    resources :wishlists, only: :create
    resources :visiteds, only: :create
  end

  get 'friends' => 'pages#friends'

end
