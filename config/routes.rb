Rails.application.routes.draw do

  Rails.application.routes.draw do
  root   'static#welcome'
  get    '/signin',   to: 'sessions#new'
  post   '/signin',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :attractions
  post '/rides/create'
end


end