Rails.application.routes.draw do

  root 'users#home'
  get '/logout' => 'users#destroy'
  get '/signin' => 'users#login'
  resources :sessions, only: [:create]
  resources :attractions
  match 'attractions/:id/ride' => 'attractions#ride', :via => :post, :as => :ride_attraction
  resources :users
  resources :users, only: [:login]
end