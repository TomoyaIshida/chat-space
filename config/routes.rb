Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'groups#index'
  resources :users, only: [:edit, :update]
  resources :groups, only: [:new, :edit, :create, :update]
    resources :messages, only: [:index]
end
