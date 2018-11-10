Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  namespace :admin do
    resources :keywords
    resources :movies
    resources :oauth_authentications
    resources :tags
    resources :tips
    resources :tip_bodies
    resources :tip_likes
    resources :tip_movies
    resources :users
    resources :user_icons
    resources :user_ranks

    root to: "keywords#index"
  end

  root to: 'root#index'

  resources :tips
  resources :users, only: %i(show)
  resources :user_ranks, only: %i(index create show update)
end
