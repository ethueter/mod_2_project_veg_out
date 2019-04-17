Rails.application.routes.draw do
  get   '/login'  => 'sessions#new'
  post  '/login'  => 'sessions#create'
  get   '/logout' => 'sessions#destroy'
  resources :restaurants
  get '/restaurants/:id/menu', to: 'restaurants#menu', as: '/menu'
  get '/restaurants/:id/add_menu_items', to: 'restaurants#add_menu_items', as: '/add_menu_item'
  get '/search', to: 'restaurants#by_cuisine', as: '/search_by_cuisine'
  resources :menu_items



  resources :users, only: [:show, :new, :create, :edit, :update]
  resources :reviews, only: [:show, :new, :create, :edit, :update, :delete]

end
