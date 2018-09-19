Rails.application.routes.draw do
  get 'pages/home'
  get 'pages/about'
  get 'pages/privacy'
  get 'pages/terms'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
