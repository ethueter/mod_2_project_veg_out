Rails.application.routes.draw do
  get   '/login'  => 'sessions#new'
  post  '/login'  => 'sessions#create'
  get   '/logout' => 'sessions#destroy'
  resources :restaurants


  

  resources :users, only: [:show, :new, :create, :edit, :update]
  resources :reviews, only: [:show, :new, :create, :edit, :update, :delete]

end
