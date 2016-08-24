source 'https://rubygems.org'

gem 'sqlite3'

gem 'dm_unibo_common',      git: 'https://github.com/donapieppo/dm_unibo_common.git',      ref: 'rails_5', branch: 'rails_5'
gem 'dm_unibo_user_search', git: 'https://github.com/donapieppo/dm_unibo_user_search.git', ref: 'master', branch: 'master'

gem "paperclip"

gem 'therubyracer', platforms: :ruby
gem 'sdoc', '~> 0.4.0', group: :doc

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development, :test do
  gem 'listen', '~> 3.0.5'
  gem 'rspec-rails', '~> 3.1.0'
  gem 'factory_girl_rails'
  gem 'mocha'
  gem 'spring'
end

