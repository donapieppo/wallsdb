Rails.application.routes.draw do
  root to: 'home#index'

  resources :walls do
    resources :openings
    resources :photos
  end
  resources :openings
  resources :photos

  get 'auth/google_oauth2/callback', to: 'logins#google_oauth2'
end
