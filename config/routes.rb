Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :admin
  resources :helper
  get 'user_index' => 'user#index', as: :user_index
end
