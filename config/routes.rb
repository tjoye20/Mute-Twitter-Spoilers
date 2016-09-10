Rails.application.routes.draw do

  resources :users, only: [:create, :show]
  #show page is your profile page. Showing you how many blocked phrases,
  #and number of blocked users.

  resources :mutedphrases do
    resources :blockedfollowers
  end

  resources :sessions, only: [:new, :create, :destroy]

  get '/sign-in', to: "sessions#new", as: "sign-in"
  get '/auth', to: "sessions#create"
  get '/logout', to: "sessions#destroy", as: "logout"

  root "sessions#new"
end
