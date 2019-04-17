Rails.application.routes.draw do
  get   '/login'  => 'sessions#new'
  post  '/login'  => 'sessions#create'
  get   '/logout' => 'sessions#destroy'
  resources :restaurants
  get '/restaurants/:id/menu', to: 'restaurants#menu', as: '/menu'
  get '/restaurants/:id/add_menu_items', to: 'restaurants#add_menu_items', as: '/add_menu_item'
  get '/restaurants/:id/reviews', to: 'reviews#show', as: 'restaurant_reviews'
  get '/restaurants/:id/new_review', to: 'reviews#new', as: 'review_restaurant'
  resources :menu_items, only: [:new, :create, :show, :edit, :update, :delete]



  resources :users, only: [:show, :new, :create, :edit, :update]
  resources :reviews, only: [:show, :new, :create, :edit, :update, :delete]

end
