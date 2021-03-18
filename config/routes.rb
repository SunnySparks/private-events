Rails.application.routes.draw do
  get 'events/index'
  get 'users/index'
  get 'users/new'
  get 'users/show'
  post 'users/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show]
  resources :events, only: [:new, :create, :index, :show]
  root to: "users#new"
end
