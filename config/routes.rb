Rails.application.routes.draw do
  get 'answers/create'
  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users, except: [:new]
  get '/signup', to: 'users#new'
  resources :questions do 
    resources :answers, only: [:create]
  end
  root to: "questions#index"
end
