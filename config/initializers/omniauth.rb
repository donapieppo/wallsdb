Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['WALLSDB_GOOGLE_APP_ID'], ENV['WALLSDB_GOOGLE_APP_SECRET'] #, {provider_ignores_state: true}
  provider :facebook, ENV['WALLSDB_FACEBOOK_KEY'], ENV['WALLSDB_FACEBOOK_SECRET']
  provider :developer
end
