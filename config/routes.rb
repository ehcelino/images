Rails.application.routes.draw do
  # get 'sessions/new'
  resources :sessions
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "articles#index"

  get '/dragndrop', to: 'image#dragndrop'
  post '/dragndrop', to: 'image#upload_images'
  resources :image
  post '/upload_images', to: 'image#upload_images'
  resources :articles
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
