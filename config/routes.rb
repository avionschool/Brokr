Rails.application.routes.draw do
  devise_for :users, controllers: {registrations:'user/registrations'}
  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#index'

  #nesting users so it becomes /user_id/role_id
  resources :users do
    resources :roles
  end
end
