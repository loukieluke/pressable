Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'pages#home'



  #User routes
  resources :users, only: [:new, :create, :edit, :update, :show, :destroy, :email, :new_email]

  #Sessions routes
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  get '/new', to: 'pages#new'
  get '/email', to: 'users#email'
  post '/email', to: 'users#email'

  get '/show', to: 'users#show'
  


end
