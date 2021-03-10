Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    root to: 'homes#top'
    resources :items, only: [:new, :create, :index, :show, :destroy]
  end
end
