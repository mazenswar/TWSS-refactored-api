Rails.application.routes.draw do
  resources :messages
  resources :conversations
  resources :likes
  resources :posts
  resources :quotes
  resources :feminists
  resources :users

  post '/login', to: 'auth#login'
  get '/auth', to: 'auth#persist'

  get '/search', to: 'search#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
