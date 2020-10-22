Rails.application.routes.draw do
  
  # get 'tasks/index'
  # get 'tasks/show'
  # get 'tasks/new'
  # post "tasks/new" => "tasks#create"
  # get 'tasks/edit'
  get 'home/index'
  get 'home/show'
  
  post "users/:user_id/tasks/new" => "tasks#create"
  post "users/:user_id/tasks/:id/edit" => "tasks#update"
  
  post 'users/:user_id/tasks/:id/done' => 'tasks#done', as: 'done'
  get 'users/:user_id/tasks/completed' => "tasks#indexcompleted", as: 'indexcompleted'
  
  # get "users/:user_id/edit" => "devise/registration#edit"
  
  root to: "home#index"
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get "users/:user_id/edit" => "devise/registration#edit"
  end
  
  resources :users do 
    resources :tasks
  end
  
  post '/callback' => 'linebot#callback'
end
