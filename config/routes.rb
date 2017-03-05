Rails.application.routes.draw do
  root to: 'home#index'

  get '/login', to: 'sessions#new'
end
