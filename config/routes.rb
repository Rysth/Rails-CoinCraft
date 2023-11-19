Rails.application.routes.draw do
  devise_for :users
  root to: 'splash#index'

  resources :users
    
  resources :categories do
    resources :movements
  end
end
