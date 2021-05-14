Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :businesses do
    # resources :bookings, only: [ :index, :new, :create ]
    delete "/delete_image_attachment/:picture_id", to: "businesses#delete_image_attachment", as: "delete_image_attachment"
    resources :reviews, only: [ :index, :new, :create ]
    resources :chatrooms, only: [:create, :show]
    resources :business_languages, only: [:new, :create]
  end

  resources :bookings, except: [ :new, :create ]
  resources :reviews, only: [ :show, :edit, :update, :destroy ]

  get '/components', to: 'pages#components', as: 'components'
  get '/account', to: 'pages#account', as: 'account'
  get '/my_businesses', to: 'pages#my_businesses', as: 'my_businesses'


  # for chatrooms
  resources :chatrooms, only: [:show, :index] do
    resources :messages, only: :create
    resources :bookings, only: [:new, :create, :show, :update, :destroy]
  end

  mount ActionCable.server => "/cable"
end
# 1. generate the models (join + lang)
# 2. generate the routes nested in business (new and create)
# 3. make seeds for languages
# 4. redirect_to after creating business to new_business_languages
# 5. select2 for selecting in form
# 6. update filter to languages
