Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root to: "pages#home"
  # User routes defined
  # resources :users, only: [:show, :index]

  resources :activities do
    # resources :invites, only: [:create, :update] # Para invitar usuarios
    resources :attendees, only: [:create, :destroy] # Para unirse a actividades
    resources :bookmarks, only: [:create, :destroy]
    resources :reviews, only: [:create, :new, :index]
  end

  resources :bookmarks, only: [:index]

  post '/invites', to: 'invites#create'
  patch '/invites/:id/accept', to: 'invites#accept_invite', as: 'accept_invite'
  patch 'invites/:id/reject', to: 'invites#reject_invite', as: 'reject_invite'

  resources :profiles, except: [:destroy]

  resources :matches, only: [:show, :index] do
    resources :messages, only: :create
  end
  # resources :users, only: [:index]
end
