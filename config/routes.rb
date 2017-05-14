Rails.application.routes.draw do
  resources :meetings
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
