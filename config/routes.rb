Rails.application.routes.draw do
  resources :meetings do
  		resources :tasks  
  	end  
  root to: 'visitors#index'
  devise_for :users
  resources :users

  mount ActionCable.server => '/cable'

  resources :my_resources do
    collection do
         get :show_form
     end
 end


end
