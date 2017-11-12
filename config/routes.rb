Rails.application.routes.draw do
  root 'pages#home'
  get  '/home', to: 'pages#home'
  resources :training_plans do
    member do
      post 'like'
    end
  end
  resources :users, except: [:new, :destroy]
  get  '/register', to: 'users#new'
  get  '/login',    to: 'logins#new'
  post '/login',    to: 'logins#create'
  get  '/logout',   to: 'logins#destroy'

  resources :skills,    only: [:new, :create, :show]
  resources :trainings, only: [:new, :create, :show, :index]
end
