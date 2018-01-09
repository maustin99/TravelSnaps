Rails.application.routes.draw do
  

  root 'users#index'

  resources :users

  resources :sessions, only: [:new, :create]

  delete '/logout' => 'sessions#destroy', as: :logout  #logout path!

  resources :pictures do  ## shortcut to make all needed routes <minus the DO>
    resources :comments     #this nests the comments with the pictures paths
  end                      #check out  'rails routes'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
