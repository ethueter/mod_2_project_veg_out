Rails.application.routes.draw do

  resources :restaurants


  

  resources :users, only: [:show, :new, :create, :edit, :update]

end
