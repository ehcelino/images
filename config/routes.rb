Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/dragndrop', to: 'image#dragndrop'
  post '/dragndrop', to: 'image#upload_images'
  resources :image
  post '/upload_images', to: 'image#upload_images'
end
