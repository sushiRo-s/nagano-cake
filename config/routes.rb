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
    get 'members' => 'members#show', as: 'member'
    get 'members/edit' => 'members#edit', as: 'edit_member'
    patch 'members' => 'members#update', as: 'update_member'
    get 'members/unsubscribe' => 'members#unsubscribe', as: 'unsubscribe'
    patch 'members/unsubscribe' => 'members#withdrawal', as: 'withdrawal'
    resources :deliveries, only: [:index, :create, :destroy, :edit, :update]
    delete 'carts/destroy_all' => 'carts#destroy_all', as: 'destroy_all'
    resources :carts, only: [:index, :create, :update, :destroy]
    post 'orders/confirm' => 'orders#confirm', as: 'confirm'
    get 'orders/complete' => 'orders#complete', as: 'complete'
    resources :orders, only: [:new, :create, :index, :show]
    resources :products, only: [:index, :show]
  end


end
