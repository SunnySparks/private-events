Rails.application.routes.draw do
  get 'user/index'
  get 'user/new'
  post 'user/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :destroy]
  root 'events#index'
end
