Rails.application.routes.draw do
  get 'sessions/create'
  get 'sessions/new'
  get 'sessions/destroy'
  resources :experiences
  resources :destinations
  resources :users do
    resources :destinations
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
