Rails.application.routes.draw do
  devise_for :members,controllers: {
  sessions: 'members/sessions',
  passwords: 'members/passwords',
  registrations: 'members/registrations'
}
  devise_for :admins, controllers: {
  sessions: 'admins/sessions',
  passwords: 'admins/passwords',
  registrations: 'admins/registrations'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  
  
  namespace :manager do
    resources :members, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :order_products, only: [:update]
    resources :products, only: [:index, :show, :new, :create, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
  end

  
  
  namespace :public do
    resources :members, only: [:show, :edit, :update]
    get 'public/members/unsubscribe' => 'public/members#unsubscribe', as: 'unsubscribe'
    patch 'public/members' => 'public/members#withdrawal', as: 'withdrawal'
    resources :deliveries, only: [:index, :create, :destroy, :edit, :update]
    resources :carts, only: [:index, :create, :update, :destroy]
    delete 'public/carts/destroy_all' => 'public/carts#destroy_all', as: 'destroy_all'
    resources :orders, only: [:new, :create, :index, :show]
    post 'public/orders/confirm' => 'public/orders#confirm', as: 'confirm'
    get 'public/orders/complete' => 'public/orders#complete', as: 'complete'
    resources :products, only: [:index, :show]
  end

  
  
end
