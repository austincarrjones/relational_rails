Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  get '/towns', to: 'towns#index'
  get 'towns/new', to: 'towns#new'
  get '/towns/:id', to: 'towns#show'
  get '/trails', to: 'trails#index'
  get '/trails/:id', to: 'trails#show'
  get '/towns/:town_id/trails', to: 'town_trails#index'
  post '/towns', to: 'towns#create'
  get '/towns/:id/edit', to: 'towns#edit'
  patch '/towns/:id', to: 'towns#update'
  get '/towns/:town_id/trails/new', to: 'trails#new'
  post '/towns/:town_id/trails', to: 'trails#create'
end
