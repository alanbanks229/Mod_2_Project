Rails.application.routes.draw do

  resources :users, only: [:index, :show, :new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :replies, only: [:index]
  resources :categories, only: [:index]
  resources :posts, only: [:index, :new, :create, :show]
  resources :comments, only: [:index]
end
