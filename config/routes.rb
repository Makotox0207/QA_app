Rails.application.routes.draw do
  get '/answers/create', to: 'answers#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users, except: [:new]
  get '/signup', to: 'users#new'
  get '/questions/solved', to: 'questions#solved'
  get '/questions/unsolved', to: 'questions#unsolved'
  resources :questions do 
    resources :answers, only: [:create]
  end
  root to: "questions#index"
  namespace :admin do
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
  end
end
