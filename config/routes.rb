Rails.application.routes.draw do
  devise_for :users
  root to: 'sloths#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :sloths do
    resources :bookings, only: [:new, :create]
  end
  resources :users
  resources :bookings, except: [:new, :create] do
      resources :reviews, only: [:new, :create, :show]
  end
end
