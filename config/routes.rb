Rails.application.routes.draw do

  #show page is your profile page.
  resources :users, only: [:create, :show]

  resources :mutedphrases do
    resources :blockedfollowers
  end

  resources :sessions, only: [:index, :new, :destroy]

  get '/sign-in', to: "sessions#new", as: "sign-in"
  get '/auth', to: "users#create"
  get '/logout', to: "sessions#destroy", as: "logout"

  root "sessions#index"
end
