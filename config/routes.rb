Rails.application.routes.draw do

  resources :users, only: [:create]

  resources :mutedphrases, only: [:index, :new, :create, :show, :destroy]

  resources :mutedphrases do
    collection do
      get :results
    end
  end

  #members require :id & collections don't 
  resources :mutedphrases do
    member do
      get :show_tweets
    end
  end

  resources :sessions, only: [:new, :destroy, :failure]

  get '/sign-in', to: "sessions#new", as: "sign-in"
  get '/auth/twitter/callback', to: "users#create"
  get '/logout', to: "sessions#destroy", as: "logout"
  get '/auth/failure', to: "sessions#failure"

  root "sessions#new"
end
