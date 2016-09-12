Rails.application.routes.draw do

  resources :users, only: [:create]

  resources :mutedphrases do
    resources :blockedfollowers
  end

  resources :sessions, only: [:index, :new, :destroy]

  # get '/sign-in', to: "sessions#new", as: "sign-in"
  get '/auth/twitter/callback', to: "users#create"
  get '/logout', to: "sessions#destroy", as: "logout"

  root "sessions#index"
end
