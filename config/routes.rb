Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root "home#index"
  get '/logout', to: 'application#logout', as: :logout
  resources :posts
end