Rails.application.routes.draw do
  root 'posts#index'
  resources :users, only: [ :new, :create, :show]
  resources :posts, only: [:new, :create, :index, :show] 

  resources :user_sessions, only: [ :new, :create, :destroy ]
 

  get 'login'  => 'user_sessions#new'
  get 'logout' => 'user_sessions#destroy'
end
