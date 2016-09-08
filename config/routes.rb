Rails.application.routes.draw do

  resources :users

  resources :mutedphrases do
    resources :blockedfollowers
  end

  resources :sessions, only: [:destroy]

  get '/sign-in', to: "users#new", as: "sign-in"
  get '/logout', to: "sessions#destroy", as: "logout"

  root "users#new"
end
