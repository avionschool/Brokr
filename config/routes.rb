Rails.application.routes.draw do
  devise_for :users
  resources :users
  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # root 'application#index'
  root 'stock#index'
  get '/stocks' => 'stock#index'

  # resources :users do
    
  # end
end
