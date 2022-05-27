Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :carriers, only: [:index, :new, :create, :edit, :update, :show]
  resources :vehicles, only: [:index, :show, :new, :create, :edit, :update]
  resources :prices, only: [:index, :new, :create, :edit, :update]
  resources :delivery_times, only: [:index, :new, :create, :edit, :update]
  resources :consults, only: [:new, :create, :show]
end
