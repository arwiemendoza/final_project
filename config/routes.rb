Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :admin
  resources :helper

  #Client redirect upon signing in 
  get 'user_index' => 'user#index', as: :user_index
  get 'user_show/:id' => 'user#show', as: :user_show
end
