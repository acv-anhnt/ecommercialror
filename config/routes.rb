Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products, only: [:index, :show]
  resource :carts, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  root to: 'products#index'
end
