Rails.application.routes.draw do
  get   '/login'  => 'sessions#new'
  post  '/login'  => 'sessions#create'
  get   '/logout' => 'sessions#destroy'
  resources :restaurants
  get '/restaurants/:id/menu', to: 'restaurants#menu', as: '/menu'
  resources :menu_items, only: [:new, :create, :show, :edit, :update, :delete]



  resources :users, only: [:show, :new, :create, :edit, :update]
  resources :reviews, only: [:show, :new, :create, :edit, :update, :delete]

end
