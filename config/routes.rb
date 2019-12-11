Rails.application.routes.draw do

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#newsfeed'

  resources :spots

  resources :users

  resources :lists

  get 'friends' => 'pages#friends'

end
