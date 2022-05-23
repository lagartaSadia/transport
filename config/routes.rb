Rails.application.routes.draw do
  root 'home#index'

  resources :carriers, only: [:index, :new, :create, :edit, :update, :show]
  resources :vehicles, only: [:index, :show]
end
