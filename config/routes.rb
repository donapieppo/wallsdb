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
end
