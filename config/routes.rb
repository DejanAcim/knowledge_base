Rails.application.routes.draw do
  root 'pages#home'
  get '/home', to: 'pages#home'
  resources :training_plans do
    member do
      post 'like'
    end
  end
  resources :users, except: [:new]
  get '/register', to: 'user#new'
end
