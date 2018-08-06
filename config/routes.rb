Rails.application.routes.draw do
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
end
