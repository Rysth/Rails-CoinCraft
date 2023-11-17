Rails.application.routes.draw do
  root to: 'splash#index'

  resources :users do
    resources :movements
  end
end
