Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :users, only: [ :new, :create, :show]
  resources :posts, only: [:new, :create, :index, :show, :destroy] 

  resources :user_sessions, only: [ :new, :create, :destroy ]
 

  get 'login'  => 'user_sessions#new'
  get 'logout' => 'user_sessions#destroy'
end
