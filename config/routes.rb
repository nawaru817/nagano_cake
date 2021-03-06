Rails.application.routes.draw do
  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }
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

    resources :items, only: [:index, :show]

    resources :cart_items, only: [:index, :update, :create]
    delete '/cart_items/destroy_all', to: 'cart_items#destroy_all'
    delete '/cart_items/:id', to: 'cart_items#destroy'

    get '/orders/complete', to: 'orders#complete'
    resources :orders, only: [:new, :create, :index, :show]
    post '/orders/confirm', to: 'orders#confirm'

    patch '/customers/withdraw', to: 'customers#withdraw'
    resources :customers, only: [:edit, :update]
    get '/customers/mypage', to: 'customers#show'
    get '/customers/unsubscribe', to: 'customers#unsubscribe'

  end

end
