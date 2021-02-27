Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :businesses do
    resources :bookings, only: [ :index, :new, :create ]
    resources :reviews, only: [ :index, :new, :create ]
    resources :chatrooms, only: [:create, :show]
  end

  resources :bookings, except: [ :index, :new, :create ]
  resources :reviews, only: [ :show, :edit, :update, :destroy ]

  get '/components', to: 'pages#components', as: 'components'
  get '/account', to: 'pages#account', as: 'account'




  # for chatrooms
  resources :chatrooms, only: [:show, :index] do
    resources :messages, only: :create
  end

  mount ActionCable.server => "/cable"
end
# 1. generate the models (join + lang)
# 2. generate the routes nested in business (new and create)
# 3. make seeds for languages
# 4. redirect_to after creating business to new_business_languages
# 5. select2 for selecting in form
# 6. update filter to languages
