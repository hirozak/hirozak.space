Rails.application.routes.draw do
  devise_for :users

  root 'top#index'
  resources :posts, only: %i[index show]
  resources :categories, only: %i[show]
  resources :tags, only: %i[index show]
  resources :about, only: %i[index]

  namespace :admin do
    root 'home#index'
    resources :posts, only: %i[new create edit update destroy] do
      get :all, :published, :drafts, on: :collection
    end
    resources :categories, only: %i[index show create]
    resources :photos, only: %i[index create]
  end

  get '*path', to: 'application#render_404'
end
