Rails.application.routes.draw do
  root 'home#top'
  get 'home/about' => "home#about"
  devise_for :users
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: [:show,:index,:edit,:update]
end