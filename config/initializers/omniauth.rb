Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV["WALLS_GOOGLE_APP_ID"], ENV["WALLS_GOOGLE_APP_SECRET"]
end
