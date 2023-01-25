Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :orders, only: [:index, :new, :create]
    resources :transacts, only: [:new, :create]
  end

end
