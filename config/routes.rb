Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :movies
  resources :seats
  resources :venues

  resource :bookings, only: [:new, :search] do
  	post :search, on: :collection
  end
  root to: 'bookings#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
