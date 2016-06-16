Rails.application.routes.draw do
  root 'items#index'

  get '/search', to: "stores#index"

  resources :stores, only: [:show]

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :items, only: [:index, :show, :create, :destroy]
    end
  end
end
