Rails.application.routes.draw do

  resources :users, only: [:create]

  resources :mutedphrases, only: [:index, :new, :create, :destroy] do
    resources :blockedfollowers, only: [:index, :show, :create]
  end

  resources :sessions, only: [:new, :destroy, :failure]

  get '/sign-in', to: "sessions#new", as: "sign-in"
  get '/auth/twitter/callback', to: "users#create"
  get '/logout', to: "sessions#destroy", as: "logout"
  get '/auth/failure', to: "sessions#failure"

  root "sessions#new"
end
