Rails.application.routes.draw do

  root "sessions#new"

  resources :users, only: [:create]

  #members require :id & collections don't
  resources :mutedphrases, only: [:index, :new, :create, :show, :destroy] do
    collection do
      get :results
      get :show_tweets
    end
  end

  resources :sessions, only: [:new, :destroy, :failure]

  get '/sign-in', to: "sessions#new", as: "sign-in"
  get '/auth/twitter/callback', to: "users#create"
  get '/logout', to: "sessions#destroy", as: "logout"
  get '/auth/failure', to: "sessions#failure"

end
