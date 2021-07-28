Rails.application.routes.draw do
  root 'users#home'
  get 'users/new', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'
  # get 'users/new'
  # get 'users/:id', to: 'users#show', as: 'user_path'
  # post 'users/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
