Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    resources :admin, only: [:index]
  end
  root 'top#index'
end
