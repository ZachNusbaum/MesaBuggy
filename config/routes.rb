Rails.application.routes.draw do

  namespace :reports do
    resources :visits, only: [:show]
  end

  scope :search do
    get '/', to: 'search#new'
    get '/results', to: 'search#show'
  end

  ActiveAdmin.routes(self)

  authenticate :user, ->(user) { user.admin? } do
    mount Blazer::Engine, at: "blazer"
    mount PgHero::Engine, at: "pghero"
    mount Delayed::Web::Engine, at: '/jobs'
  end

  resources :categories, only: [:show]
  resources :products, only: [:show, :edit, :update] do
    resource :reviews, only: [:create]
  end
  resources :attachments, only: [:destroy]

  scope :cart do
    get '/', to: 'shopping_cart#show', as: 'cart'
    post 'add/:id', to: 'shopping_cart#add_product', as: 'cart_add_item'
    post 'apply_coupon', to: 'shopping_cart#apply_coupon', as: 'apply_coupon'
    delete 'coupon', to: 'shopping_cart#remove_coupon', as: 'remove_coupon'
    patch '/update_qty/:id', to: 'shopping_cart#update_qty', as: 'update_qty'
    delete '/cart/item/:id', to: 'shopping_cart#remove_item', as: 'remove_item'
    get 'checkout', to: 'shopping_cart#checkout', as: 'checkout'
    post 'checkout', to: 'shopping_cart#process_checkout'
    scope :checkout do
      get 'success/:id', to: 'shopping_cart#checkout_success', as: 'checkout_success'
    end
  end

  get 'privacy_policy', to: 'pages#privacy'
  get 'about', to: 'pages#about'
  get 'terms', to: 'pages#terms'
  get 'help', to: 'pages#help'

  namespace :api do
    get 'zip/:code', to: 'zip_codes#lookup'
    get 'geocode/:query', to: 'zip_codes#geocode'
  end

  root to: 'pages#home'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
