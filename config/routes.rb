Rails.application.routes.draw do

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  get '/service-worker.js' => "service_worker#service_worker"
  get '/manifest.json' => "service_worker#manifest"

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

  resources :users, only: [:index, :show] do
    member do
      post :follow
      post :unfollow
      get :wishlists, only: [:index]
      get :favourites, only: [:index]
      get :friendships, only: [:index]
    end
  end

  resources :friend_requests, only: [:index, :create, :update, :destroy]
  resources :friendships, only: [:index]


  resources :pending, only: [:index, :destroy]
  resources :request, only: [:index, :destroy]

  get 'friends' => 'pages#friends'
  get 'newsfeed' => 'pages#newsfeed'

end
