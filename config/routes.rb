Rails.application.routes.draw do

  get '/teachers/signup' => 'teachers#new'
  post '/teachers/singup' => 'teachers#create'
  
  resources :enrolled_courses
  resources :courses
  resources :teachers
  resources :students
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
