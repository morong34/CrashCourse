Rails.application.routes.draw do
  root 'courses#index'
  get 'about', to: 'pages#about'
  get 'course/new', to: 'courses#new'
  resources :students
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  post 'course_enroll', to: 'students_courses#create'
end
