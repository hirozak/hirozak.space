Rails.application.routes.draw do
  devise_for :users
  resources :admin, only: %i(index)
  namespace :admin do
    resources :posts, only: %i(new create edit update destroy) do
      get :all, :published, :drafts, on: :collection
    end
    resources :categories, only: %i(index show create)
  end
  root 'top#index'
end
