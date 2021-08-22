Rails.application.routes.draw do
  root 'static#home'  
  resources :enrolled_courses
  resources :courses

  resources :teachers do
    resources :courses, only: [:show, :index, :new]
  end
  
  resources :students
  match '/auth/:provider/callback', to: 'sessions#omni_create', via: [:get, :post]
  # get '/auth/:provider/callback' => 'sessions#create'
  get '/signin', to: 'sessions#new', as: 'signin'
  # get '/auth/facebook/callback' => 'sessions#create'
  post '/session', to: 'sessions#create', as: 'session'
  delete '/session/', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
