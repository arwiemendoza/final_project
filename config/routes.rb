Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :admin 
  resources :helper
  resources :category do 
    resources :tasks
  end
  
  #Client redirect upon signing in 
  get 'user_index' => 'user#index', as: :user_index
  get 'user_show/:id' => 'user#show', as: :user_show


  get 'approve_status/:id' => 'admin#approve_status', as: :approve_status
  get 'reject_status/:id' => 'admin#reject_status', as: :reject_status

  get 'user_list' => 'admin#user_list', as: :user_list

  patch 'category/:category_id/tasks/:id/accept_task' => 'tasks#accept_task', as: :accept_task

  patch 'category/:category_id/tasks/:id/accept_helper' => 'tasks#accept_helper', as: :accept_helper
end
