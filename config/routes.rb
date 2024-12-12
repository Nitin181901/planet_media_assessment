Rails.application.routes.draw do
  post '/register', to: 'users#register'
  post '/login', to: 'users#login'

  resources :tasks, only: [:create, :index, :show, :update, :destroy]
end
