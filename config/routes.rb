Rails.application.routes.draw do
  devise_for :customers
  devise_for :admin
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    root to: 'homes#top'
    resources :items, only: [:new, :create, :index, :show, :edit, :update, :destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end

  scope module: :public do
    root to: 'homes#top'
    get '/about', to: 'homes#about'

  end

end
