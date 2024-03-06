Rails.application.routes.draw do
  resources :profiles
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: :show do
    resources :activities, only: [:new, :create]
  end
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root to: "pages#home"
  resources :activities, only: [:index, :show] do
    resources :invites, only: [:create, :update] # Para invitar usuarios
    resources :attendees, only: [:create, :destroy] # Para unirse a actividades
  end

  resources :profiles, except: [:index]
end
