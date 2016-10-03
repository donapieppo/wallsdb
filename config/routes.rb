Rails.application.routes.draw do
  root to: 'home#index'

  resources :walls do
    get :own, on: :member
    resources :admins
    resources :openings
    resources :photos
    resources :events
  end

  resources :admins
  resources :openings
  resources :photos
  resources :events do 
    resources :photos
  end

  post 'search', to: 'home#search', as: :search

  get 'login', to: 'logins#index', as: :login
  # get 'login_facebook', to: 'logins#facebook', as: :facebook_login
 
  get 'logins/logout',               to: 'logins#logout',    as: :logout
  get 'auth/google_oauth2',          as: 'google_login'
  get 'auth/google_oauth2/callback', to: 'logins#google_oauth2'
  get 'auth/facebook',               as: 'facebook_login'
  get 'auth/facebook/callback',      to: 'logins#facebook'
  get 'logins/no_access',            to: 'logins#no_access', as: :no_access

  post 'auth/developer/callback',    to: 'logins#developer'

  get '/privacy', to: 'home#privacy', as: :privacy

  get '/(:province)', to: 'home#index'
end
