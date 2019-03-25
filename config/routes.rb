Rails.application.routes.draw do
  root "static_pages#home"
  get "/signin", to: "sessions#new"
  post "/sessions/create", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"
  get '/auth/facebook/callback' => 'sessions#create'
  get '/auth/github/callback' => 'sessions#create'


  resources :users do
    resources :destinations do
      resources :experiences
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
