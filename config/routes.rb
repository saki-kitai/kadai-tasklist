Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #HTTPリクエストアクション 'URL(パス)', to: 'controller名#action'の構文
  #例) get 'task/:id', to: 'tasks#show'
  
  root to: 'tasks#index'
  
  resources :tasks
  
end