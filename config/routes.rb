Rails.application.routes.draw do
  root 'home#top'
  get 'home/about' => "home#about"
  devise_for :users
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:show,:index,:edit,:update]

  resources :relationships, only: [:create, :destroy]
  get "users/:id/follow" => "users#follow", as:"follow"
  get "users/:id/follower" => "users#follower", as:"follower"
  get "/search" => "search#search"
end