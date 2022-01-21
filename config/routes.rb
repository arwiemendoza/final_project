Rails.application.routes.draw do
  resources :attachments
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

  get 'tasks/:task_id/:client_id/show_task_info' => 'helper#show_task_info', as: :show_task_info

  get 'approve_status/:id' => 'admin#approve_status', as: :approve_status
  get 'reject_status/:id' => 'admin#reject_status', as: :reject_status

  get 'user_list' => 'admin#user_list', as: :user_list

  get 'category/:category_id/tasks/:id/accept_task' => 'tasks#accept_task', as: :accept_task

  get 'tasks/:task_id/user/:user_id/accept_helper' => 'tasks#accept_helper', as: :accept_helper

  get 'tasks/:task_id/complete_task' => 'tasks#complete_task', as: :complete_task
  
  get 'tasks/:task_id/finish_task' => 'tasks#finish_task', as: :finish_task

  get 'task/:id/helper/:user_id' => 'helper#show_applicant', as: :show_applicant

  get 'task/:id/helper/:helper_id/getrate' => 'helper#get_rate_helper', as: :get_rate_helper
  post 'task/:id/helper/:helper_id/patchrate' => 'helper#patch_rate_helper', as: :patch_rate_helper

  get 'task/:id/client/:client_id/getrate' => 'user#get_rate_client', as: :get_rate_client
  post 'task/:id/client/:client_id/patchrate' => 'user#patch_rate_client', as: :patch_rate_client

  post 'user/:id/deposit' => 'user#deposit', as: :deposit
  post 'user/:id/withdraw' => 'user#withdraw', as: :withdraw
end
