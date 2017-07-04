Rails.application.routes.draw do
  root to: 'users#show'

  get    '/login', to: 'sessions#new'
  delete '/login', to: 'sessions#destroy', as: 'logout'

  get '/credentials', to: 'users#new'
  post '/credentials', to: 'users#create'

  get '/auth/facebook', as: 'facebook_login'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: 'sessions#failure'
end
