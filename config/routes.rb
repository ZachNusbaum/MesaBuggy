Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  get 'privacy_policy', to: 'pages#privacy'
  get 'about', to: 'pages#about'
  root to: 'pages#home'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
