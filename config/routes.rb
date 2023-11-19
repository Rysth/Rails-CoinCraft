Rails.application.routes.draw do
  devise_for :users
  root to: 'splash#index'

  resources :users do
    resources :movements
  end
  resources :categories
end
