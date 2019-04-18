Rails.application.routes.draw do
  get   '/login'  => 'sessions#new'
  post  '/login'  => 'sessions#create'
  get   '/logout' => 'sessions#destroy'
  post '/restaurants/search', to: 'restaurants#search_by_name', as: 'search_restaurant_name'
  resources :restaurants
  get '/restaurants/:id/menu', to: 'restaurants#menu', as: 'menu'
  get '/restaurants/:id/add_menu_items', to: 'restaurants#add_menu_items', as: 'add_menu_item'

  get '/search', to: 'restaurants#by_cuisine', as: 'by_cuisine'

  resources :menu_items

  get '/restaurants/:id/reviews', to: 'reviews#show', as: 'restaurant_reviews'
  get '/restaurants/:id/new_review', to: 'reviews#new', as: 'review_restaurant'

  


  resources :users, only: [:show, :new, :create, :edit, :update]
  resources :reviews

end
