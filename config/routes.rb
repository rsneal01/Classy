Rails.application.routes.draw do
  root 'static#home'  
  resources :enrolled_courses
  resources :courses

  resources :teachers do
    resources :courses, only: [:show, :index, :new]
  end
  
  resources :students
  match '/auth/github/callback', to: 'sessions#create', via: [:get, :post]
  # get '/auth/github/callback' => 'sessions#create'
  get '/signin', to: 'session#new', as: 'signin'
  get '/auth/facebook/callback' => 'sessions#create'
  post '/session', to: 'session#create', as: 'session'
  delete '/session/', to: 'session#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
