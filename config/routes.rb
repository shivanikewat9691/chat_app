Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'users#index'
  # root 'users#new'
  # get 'users/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :accounts
  resources :users
  get 'signup', to: 'users#new',as: 'signup'
  post 'users/verify_pin', to: 'users#verify_pin'
  post 'users/login', to: 'users#login'

  # get 'signup', to: 'users#new'
  # post 'signup', to: 'users#create'
end