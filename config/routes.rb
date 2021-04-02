Rails.application.routes.draw do
  get 'sessions/index'
  get 'events/index'
  get 'users/index'
  get 'users/new'
  get 'users/show'
  get 'events/show'
  post 'users/new'
  post 'events/index'
  get 'sessions/new'
  post  'sessions/create'
  delete  'sessions/destroy'
  

  resources :sessions, only: [:create, :new, :destroy]
  get '/signup', to: 'users#new'
  get '/logout', to: 'sessions#destroy'
  get '/login', to: 'sessions#new'

  resources :users, only: [:new, :create, :show]
  resources :events, only: [:new, :create, :index, :show]
  resources :registrations, only: [:create]
  resources :sessions, only: [:create, :destroy]
  root to: "users#new"
  
  resources :events do
    post 'attend', on: :member
  end
end
