Rails.application.routes.draw do

  resources :users, only: [:index, :show, :new, :create, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :replies, only: [:index, :new, :create] #At the end we don't need index for replies
  resources :categories, only: [:index, :show, :new, :create, :destroy]
  resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy] #No need for index for posts
  resources :comments, only: [:new, :show, :create, :edit, :update, :destroy]


  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#logout'
  get '/about' => 'sessions#about' #This will be the homepage/about page... will display options to log in or signup

end
