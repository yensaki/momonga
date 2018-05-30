Rails.application.routes.draw do
  root to: 'root#index'

  resources :tips
end
