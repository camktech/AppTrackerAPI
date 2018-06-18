Rails.application.routes.draw do
  post 'login' => 'sessions#create'
  post 'logout' => 'sessions#destroy'

  resources :resumes
  resources :skills
  resources :interviews
  resources :applications
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
