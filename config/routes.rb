Rails.application.routes.draw do
  get 'replies/new'
  get 'replies/show'
  get 'replies/edit'
  get 'comments/show'
  get 'comments/new'
  get 'comments/edit'
  get 'posts/index'
  get 'posts/show'
  get 'posts/new'
  get 'categories/index'
  get 'categories/show'
  get 'categories/new'
  get 'users/index'
  get 'users/show'
  get 'users/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
