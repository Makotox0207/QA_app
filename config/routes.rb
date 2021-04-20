Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users, except: [:new]
  get '/signup', to: 'users#new'
  root to: "users#index"
end
