Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :todos do
    resources :items
  end
  
  get '/todos/login', to: 'todos#login'
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
end
