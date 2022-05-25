Rails.application.routes.draw do
  root 'home#index'

  resources :carriers, only: [:index, :new, :create, :edit, :update, :show]
  resources :vehicles, only: [:index, :show, :new, :create, :edit, :update]
  resources :prices, only: [:index, :new, :create, :edit, :update]
end
