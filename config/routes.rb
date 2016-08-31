Rails.application.routes.draw do
  root to: 'home#index'

  resources :walls do
    resources :openings
    resources :photos
    resources :admins
  end
  resources :openings
  resources :photos

  resources :admins
 
  get 'auth/google_oauth2/callback', to: 'logins#google_oauth2'
  get 'auth/google_oauth2',          as: 'google_login'
  get 'logins/no_access',            to: 'logins#no_access', as: :no_access
  get 'logins/logout',               to: 'logins#logout',    as: :logout
end
