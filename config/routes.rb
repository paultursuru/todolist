Rails.application.routes.draw do
  devise_for :users
  root to: 'tasks#index'
  resources :tasks, only: [:index, :create, :edit, :destroy] do
    resources :comments, only: :create
  end
  resources :comments, only: :destroy
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
