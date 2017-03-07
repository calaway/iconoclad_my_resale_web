Rails.application.routes.draw do
  root to: 'home#index'

  get '/login', to: 'sessions#new'

  get '/auth/:provider/callback', to: 'sessions#create'
end
