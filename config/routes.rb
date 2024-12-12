Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/register', to: 'users#register'
  post '/login', to: 'users#login'

  resources :tasks, only: [:create, :index, :show, :update, :destroy]
end
