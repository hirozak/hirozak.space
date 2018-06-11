Rails.application.routes.draw do
  devise_for :users
  resources :admin, only: %(index)
  root 'top#index'
end
