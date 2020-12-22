Rails.application.routes.draw do
  devise_for :users
  root to: 'tasks#index'
  resources :tasks, only: [:index, :create, :edit, :destroy] do
    resources :comments, only: :create
  end
  post 'mark_as_done/:id', to: 'tasks#mark_as_done', as: 'mark_as_done'
  post 'mark_as_cancelled/:id', to: 'tasks#mark_as_cancelled', as: 'mark_as_cancelled'
  post 'mark_as_todo/:id', to: 'tasks#mark_as_todo', as: 'mark_as_todo'
  post 'mark_as_very_urgent/:id', to: 'tasks#mark_as_very_urgent', as: 'mark_as_very_urgent'
  post 'mark_as_urgent/:id', to: 'tasks#mark_as_urgent', as: 'mark_as_urgent'
  post 'mark_as_normal/:id', to: 'tasks#mark_as_normal', as: 'mark_as_normal'
  resources :comments, only: :destroy
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
