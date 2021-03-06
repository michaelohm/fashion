Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'
  
  resources :posts do
  	resources :likes
  	resources :comments
  end
  
  resources :users, only: [:show]
end
