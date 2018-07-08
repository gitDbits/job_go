Rails.application.routes.draw do
  root 'home#index'

  resources :jobs

  resources :companies

  resources :categories
end
