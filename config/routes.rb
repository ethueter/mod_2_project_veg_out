Rails.application.routes.draw do

  resources :restaurants
  get '/restaurants/:id/menu', to: 'restaurants#menu', as: '/menu'
  resources :menu_items, only: [:new, :create, :show, :edit, :update, :delete]



  resources :users, only: [:show, :new, :create, :edit, :update]

end
