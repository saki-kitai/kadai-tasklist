Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #HTTPリクエストアクション 'URL(パス)', to: 'controller名#action'の構文
  #例) get 'task/:id', to: 'tasks#show'
  
  root to: 'tasks#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'  
  
  get 'signup', to:'users#new'
  #resources :users, only: [:index, :show, :new, :create]
  resources :users, only: [:new, :create]
  resources :tasks
  
  
end