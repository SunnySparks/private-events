Rails.application.routes.draw do
  get 'events/index'
  get 'users/index'
  get 'users/new'
  get 'users/show'
  post 'users/new'
  post 'events/index'

  resources :users, only: [:new, :create, :show]
  resources :events, only: [:new, :create, :index, :show]
  resources :registrations, only: [:create]
  root to: "users#new"
  
  resources :events do
    post 'attend', on: :member
  end
end
